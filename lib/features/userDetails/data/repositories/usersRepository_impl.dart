import 'package:dartz/dartz.dart';
 import '../../../../core/error/exception.dart';
import '../../../../core/error/faliures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repositories.dart';
import '../data_sources/remote_data_source.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersRemoteDatasource usersRemoteDatasource;

  UsersRepositoryImpl({required this.usersRemoteDatasource});

  @override
  Future<Either<Failure, List<UserEntity>>> getAllUsers(int page) async {
    try {
      final remoteUsers = await usersRemoteDatasource.getAllUsers(page);
      final entities = remoteUsers.map((e) => e.toEntity()).toList();
      return Right(entities);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure()); // Optionally wrap other errors
    }
  }
}
