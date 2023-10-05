import 'package:clean_architecture_ttd_jsonplaceholder/core/error/exception.dart';
import 'package:clean_architecture_ttd_jsonplaceholder/core/error/faliure.dart';
import 'package:clean_architecture_ttd_jsonplaceholder/core/network/network_info.dart';
import 'package:clean_architecture_ttd_jsonplaceholder/featuers/posts/data/darasources/post_local_data_source.dart';
import 'package:clean_architecture_ttd_jsonplaceholder/featuers/posts/data/darasources/post_remote_data_source.dart';
import 'package:clean_architecture_ttd_jsonplaceholder/featuers/posts/data/models/post_model.dart';

import 'package:clean_architecture_ttd_jsonplaceholder/featuers/posts/domain/entities/post_entity.dart';

import 'package:dartz/dartz.dart';

import '../../domain/reposaitioies/post_reposaitory.dart';

typedef Future<Unit> AddOrDeleOrUpdatePosts();

class PostReposaitoryImpl implements PostReposaitory {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetWorkInfo netWorkInfo;
  PostReposaitoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.netWorkInfo});

  @override
  Future<Either<Faliure, List<Post>>> getAllposts() async {
    if (await netWorkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getAllPosts();
        localDataSource.cachePosts(remotePosts);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFaliure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachedPosts();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFaliure());
      }
    }
  }

  @override
  Future<Either<Faliure, Unit>> addPost(Post post) async {
    final postModel =
        PostModel(id: post.id, title: post.title, body: post.body);
    return await _getMessage(() {
      return remoteDataSource.addPosts(postModel);
    });
  }

  @override
  Future<Either<Faliure, Unit>> deletePost(int postId) async {
    return await _getMessage(() {
      return remoteDataSource.deletePosts(postId);
    });
  }

  @override
  Future<Either<Faliure, Unit>> updataPost(Post post) async {
    final postModel =
        PostModel(id: post.id, title: post.title, body: post.body);
    return await _getMessage(() {
      return remoteDataSource.updatePosts(postModel);
    });
  }

  // ignore: unused_element
  Future<Either<Faliure, Unit>> _getMessage(
      AddOrDeleOrUpdatePosts addOrDeleOrUpdatePosts) async {
    if (await netWorkInfo.isConnected) {
      try {
        await addOrDeleOrUpdatePosts();
        return Right(unit);
      } on ServerException {
        return Left(ServerFaliure());
      }
    } else {
      return Left(OfflineFaliure());
    }
  }
}
