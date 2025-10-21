import 'package:dartz/dartz.dart';
 import '../../../../core/error/faliures.dart';
 import '../entities/user_entity.dart';


abstract class UsersRepository
{
  Future<Either<Failure,List<UserEntity>>> getAllUsers(int page);

}