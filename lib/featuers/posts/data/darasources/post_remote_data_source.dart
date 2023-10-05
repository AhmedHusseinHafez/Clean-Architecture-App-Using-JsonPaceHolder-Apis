import 'dart:convert';

import 'package:clean_architecture_ttd_jsonplaceholder/core/error/exception.dart';
import 'package:clean_architecture_ttd_jsonplaceholder/featuers/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> addPosts(PostModel postModel);
  Future<Unit> updatePosts(PostModel postModel);
  Future<Unit> deletePosts(int postId);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;
  // ignore: non_constant_identifier_names
  final String BASE_URL = 'https://jsonplaceholder.typicode.com';

  PostRemoteDataSourceImpl({required this.client});
  @override
  Future<List<PostModel>> getAllPosts() async {
    final Response response = await client.get(Uri.parse("$BASE_URL/posts/"),
        headers: {"Content-Type": "JsonPlaceHolderApp"});
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;
      final List<PostModel> postModels = decodeJson
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      return postModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPosts(PostModel postModel) async {
    final body = {"title": postModel.title, "body": postModel.body};
    final Response response =
        await client.post(Uri.parse("$BASE_URL/posts/"), body: body);
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePosts(int postId) async {
    final Response response = await client.delete(
        Uri.parse("$BASE_URL/posts/${postId.toString()}"),
        headers: {"Content-Type": "JsonPlaceHolderApp"});
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePosts(PostModel postModel) async {
    final postId = postModel.id.toString();
    final body = {"title": postModel.title, "body": postModel.body};
    final Response response =
        await client.patch(Uri.parse("$BASE_URL/posts/$postId"), body: body);
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
