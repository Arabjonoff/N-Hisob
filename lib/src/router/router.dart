import 'package:flutter/material.dart';
import 'package:n_hisob/src/ui/auth/login/login_screen.dart';
import 'package:n_hisob/src/ui/auth/verfication/verfication_screen.dart';
import 'package:n_hisob/src/ui/menu/agent/agent_sreen.dart';
import 'package:n_hisob/src/ui/menu/expensive/add_expensive.dart';
import 'package:n_hisob/src/ui/menu/home/home_screen.dart';
import 'package:n_hisob/src/ui/menu/income/add_income_screen.dart';
import 'package:n_hisob/src/ui/menu/main_screen.dart';
import 'package:n_hisob/src/ui/menu/outcome/add_outcome_screen.dart';
import 'package:n_hisob/src/ui/menu/outcome/outcome_screen.dart';
import 'package:n_hisob/src/ui/menu/wallet/wallet_screen.dart';
import 'package:n_hisob/src/ui/onborading/onboarding.dart';

import '../ui/auth/register/register_screen.dart';

class Routers{
Route? onGenerator(RouteSettings settings){
  var args = settings.arguments;
  switch(settings.name){
    case '/register':
      return _navigate(const RegisterScreen());
    case '/onBoarding':
      return _navigate(OnBoardingScreen(image: args.toString(), title: args.toString(), subtitle: args.toString(),));
    case '/login':
      return _navigate(const Loginscreen());
    case '/activate':
      return _navigate(const VerificationScreen());
    case '/home':
      return _navigate(const HomeScreen());
    case '/addIncome':
      return _navigate(const AddIncomeScreen());
    case '/addAgent':
      return _navigate(const AddAgentScreen());
    case '/income':
      return _navigate(const AddIncomeScreen());
    case '/outcome':
      return _navigate(const OutcomeScreen());
    case '/addOutcome':
      return _navigate(const AddOutComeScreen());
    case '/addExpensive':
      return _navigate(const AddExpensiveScreen());
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
