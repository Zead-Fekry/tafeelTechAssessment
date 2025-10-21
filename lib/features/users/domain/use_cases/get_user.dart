import 'package:dartz/dartz.dart';

import '../../../../core/error/faliures.dart';
import '../../../userDetails/domain/entities/user_entity.dart';
 import '../repositories/user_repository.dart';

class GetSingleUser {
  final UserRepository repository;

  GetSingleUser(this.repository);

  Future<Either<Failure, UserEntity>> call(int id) {
    return repository.getUser(id);
  }
}
