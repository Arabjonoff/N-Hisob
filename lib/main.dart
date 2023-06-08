import 'package:flutter/material.dart';
import 'package:n_hisob/src/router/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final _route = Routers();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'N-Hisob',
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/onBoarding',
      onGenerateRoute: _route.onGenerator,
    );
  }
}

