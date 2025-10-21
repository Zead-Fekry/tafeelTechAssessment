import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/faliures.dart';
 import '../../../userDetails/domain/entities/user_entity.dart';
 import '../../domain/repositories/user_repository.dart';
import '../data_sources/remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource usersRemoteDatasource;

  UserRepositoryImpl({required this.usersRemoteDatasource});

  @override
  Future<Either<Failure, UserEntity>> getUser(int id) async {
    try {
      final remoteUser = await usersRemoteDatasource.getUser(id);
      return Right(remoteUser.toEntity());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure()); // Optionally differentiate later
    }
  }
}
