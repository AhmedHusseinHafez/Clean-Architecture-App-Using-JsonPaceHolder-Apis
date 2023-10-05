import 'package:clean_architecture_ttd_jsonplaceholder/core/error/faliure.dart';
import 'package:clean_architecture_ttd_jsonplaceholder/featuers/posts/domain/reposaitioies/post_reposaitory.dart';
import 'package:dartz/dartz.dart';

class DeletePostUseCase {
  final PostReposaitory reposaitory;
  DeletePostUseCase(this.reposaitory);

  Future<Either<Faliure, Unit>> call(int id) async {
    return await reposaitory.deletePost(id);
  }
}
