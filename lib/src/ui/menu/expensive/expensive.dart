import 'package:flutter/material.dart';
import 'package:n_hisob/src/theme/color/colors.dart';

class ExpensiveScreen extends StatefulWidget {
  const ExpensiveScreen({Key? key}) : super(key: key);

  @override
  State<ExpensiveScreen> createState() => _ExpensiveScreenState();
}

class _ExpensiveScreenState extends State<ExpensiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
