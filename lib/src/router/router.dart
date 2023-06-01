import 'package:flutter/material.dart';
import 'package:n_hisob/src/ui/auth/login/login_screen.dart';
import 'package:n_hisob/src/ui/auth/verfication/verfication_screen.dart';
import 'package:n_hisob/src/ui/menu/home/home_screen.dart';
import 'package:n_hisob/src/ui/menu/income/income_screen.dart';
import 'package:n_hisob/src/ui/menu/main_screen.dart';
import 'package:n_hisob/src/ui/menu/outcome/outcome_screen.dart';
import 'package:n_hisob/src/ui/menu/wallet/wallet_screen.dart';

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
    case '/income':
      return _navigate(const IncomeScreen());
    case '/debt':
      return _navigate(const OutcomeScreen());
    case '/main':
      return _navigate(const MainScreen());
    case '/wallet':
      return _navigate(const WalletScreen());
  }
}

  _navigate(Widget screen){
    return MaterialPageRoute(builder: (context) => screen);
  }
}
