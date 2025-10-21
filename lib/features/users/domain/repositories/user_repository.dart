import 'package:dartz/dartz.dart';
import '../../../../core/error/faliures.dart';
import '../../../userDetails/domain/entities/user_entity.dart';


abstract class UserRepository
{
  Future<Either<Failure,UserEntity>> getUser(int id);

}