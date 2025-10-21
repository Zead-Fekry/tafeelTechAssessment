import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'features/userDetails/data/data_sources/remote_data_source.dart';
import 'features/userDetails/data/repositories/usersRepository_impl.dart';
import 'features/userDetails/domain/repositories/user_repositories.dart';
import 'features/userDetails/domain/use_cases/getAllUsers.dart';
import 'features/userDetails/presentation/manager/get_users_cubit.dart';
import 'features/users/data/data_sources/remote_data_source.dart';
import 'features/users/data/repositories/user_repository_impl.dart';
import 'features/users/domain/repositories/user_repository.dart';
import 'features/users/domain/use_cases/get_user.dart';
import 'features/users/presentation/manager/get_user_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<Dio>(() => Dio());

  //! Data Sources
  sl.registerLazySingleton<UsersRemoteDatasource>(
        () => UsersRemoteDatasourceImplWithDio(dio: sl()),
  );
  sl.registerLazySingleton<UserRemoteDatasource>(
        () => UserRemoteDatasourceImplWithDio(dio: sl()),
  );

  //! Repository
  sl.registerLazySingleton<UsersRepository>(
        () => UsersRepositoryImpl(usersRemoteDatasource: sl()),
  );
  sl.registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(usersRemoteDatasource: sl()),
  );
  //! Use Cases
  sl.registerLazySingleton<GetAllUsers>(() => GetAllUsers(sl()));
  sl.registerLazySingleton<GetSingleUser>(() => GetSingleUser(sl()));

  //! Cubits
  sl.registerFactory(() => GetUsersCubit(getAllUsers: sl()));
  sl.registerFactory(() => GetSingleUserCubit(getSingleUser: sl()));
}
