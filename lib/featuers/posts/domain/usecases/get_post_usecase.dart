import 'package:clean_architecture_ttd_jsonplaceholder/core/error/faliure.dart';
import 'package:clean_architecture_ttd_jsonplaceholder/featuers/posts/domain/entities/post_entity.dart';
import 'package:clean_architecture_ttd_jsonplaceholder/featuers/posts/domain/reposaitioies/post_reposaitory.dart';
import 'package:dartz/dartz.dart';

class GetAllPostsUseCase {
  final PostReposaitory reposaitory;
  GetAllPostsUseCase(this.reposaitory);

  Future<Either<Faliure, List<Post>>> call() async {
    return await reposaitory.getAllposts();
  }
}
