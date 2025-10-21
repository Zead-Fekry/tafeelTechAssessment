import 'package:tech_assessment/features/userDetails/domain/entities/user_entity.dart';

import '../../../../core/error/faliures.dart';
import '../repositories/user_repositories.dart';
import 'package:dartz/dartz.dart';


class GetAllUsers
{
final UsersRepository userRepository;

  GetAllUsers(this.userRepository);
Future<Either<Failure, List<UserEntity>>> call(int page) async
{
  return await userRepository.getAllUsers(page);
}

}