import 'package:clean_architecture_ttd_jsonplaceholder/core/error/faliure.dart';
import 'package:clean_architecture_ttd_jsonplaceholder/featuers/posts/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PostReposaitory {
  Future<Either<Faliure, Unit>> addPost(Post post);
  Future<Either<Faliure, Unit>> updataPost(Post post);
  Future<Either<Faliure, Unit>> deletePost(int id);
  Future<Either<Faliure, List<Post>>> getAllposts();
}
