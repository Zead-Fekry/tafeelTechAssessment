import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

  import 'features/userDetails/data/data_sources/remote_data_source.dart';
import 'features/userDetails/data/repositories/usersRepository_impl.dart';
import 'features/userDetails/domain/repositories/user_repositories.dart';
import 'features/userDetails/domain/use_cases/getAllUsers.dart';
import 'features/userDetails/presentation/manager/get_users_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! External
  sl.registerLazySingleton<Dio>(() => Dio());

  //! Data Sources
  sl.registerLazySingleton<UsersRemoteDatasource>(
        () => UsersRemoteDatasourceImplWithDio(dio: sl()),
  );

  //! Repository
  sl.registerLazySingleton<UsersRepository>(
        () => UsersRepositoryImpl(usersRemoteDatasource: sl()),
  );

  //! Use Cases
  sl.registerLazySingleton<GetAllUsers>(
        () => GetAllUsers(sl()),
  );

  //! Cubit / Bloc
  sl.registerFactory(
        () => GetUsersCubit(getAllUsers: sl()),
  );
}
