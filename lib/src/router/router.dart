import 'package:flutter/material.dart';
import 'package:n_hisob/src/ui/auth/login/login_screen.dart';
import 'package:n_hisob/src/ui/auth/verfication/verfication_screen.dart';
import 'package:n_hisob/src/ui/menu/home/home_screen.dart';

import '../ui/auth/register/register_screen.dart';

class Routers{
Route? onGenerator(RouteSettings settings){
  var args = settings.arguments;
  switch(settings.name){
    case '/register':
      return _navigate(const RegisterScreen());
    case '/login':
      return _navigate(const Loginscreen());
    case '/activate':
      return _navigate(const VerificationScreen());
    case '/home':
      return _navigate(const HomeScreen());
  }
}

  _navigate(Widget screen){
    return MaterialPageRoute(builder: (context) => screen);
  }
}
