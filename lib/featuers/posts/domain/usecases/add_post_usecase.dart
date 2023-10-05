import 'package:clean_architecture_ttd_jsonplaceholder/core/error/faliure.dart';
import 'package:clean_architecture_ttd_jsonplaceholder/featuers/posts/domain/entities/post_entity.dart';
import 'package:clean_architecture_ttd_jsonplaceholder/featuers/posts/domain/reposaitioies/post_reposaitory.dart';
import 'package:dartz/dartz.dart';

class AddPostUseCase {
  final PostReposaitory reposaitory;
  AddPostUseCase(this.reposaitory);

  Future<Either<Faliure, Unit>> call(Post post) async {
    return await reposaitory.addPost(post);
  }
}
