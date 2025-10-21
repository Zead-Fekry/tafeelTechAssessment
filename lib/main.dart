import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/routing/routes.dart';
import 'features/userDetails/presentation/manager/get_users_cubit.dart';
import 'injection_container.dart' as di;

import 'core/routing/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key,required this.appRouter});

   @override
  Widget build(BuildContext context) {
     return MultiBlocProvider(
       providers:
       [
         BlocProvider(create: (_) => di.sl<GetUsersCubit>()),
       ],
       child: MaterialApp(
         theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
           useMaterial3: false,
         ),
         debugShowCheckedModeBanner: false,
          initialRoute: Routes.splashScreen,
         onGenerateRoute:appRouter.generateRoute     ),
     );
  }
}


