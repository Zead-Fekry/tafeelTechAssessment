 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_assessment/core/routing/routes.dart';

import '../../features/splash/splash_screen.dart';
import '../../features/userDetails/presentation/screens/home_page.dart';


class AppRouter
{
Route generateRoute(RouteSettings settings)
{
  final arguments = settings.arguments;
  switch (settings.name)
  {
    case "/":
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
    case "/start":
    case Routes.splashScreen:
      return MaterialPageRoute(
        builder: (context) =>  SplashScreen(),
      );
    case Routes.usersScreen:
      return MaterialPageRoute(
        builder: (context) =>  UsersScreen(),
      );
    default:
      SystemNavigator.pop();
      return MaterialPageRoute(

        builder: (_) => const Scaffold(),
      );
  }
}


}