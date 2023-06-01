import 'package:flutter/material.dart';
import 'package:n_hisob/src/theme/color/colors.dart';

class OutcomeScreen extends StatefulWidget {
  const OutcomeScreen({Key? key}) : super(key: key);

  @override
  State<OutcomeScreen> createState() => _OutcomeScreenState();
}

class _OutcomeScreenState extends State<OutcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(child: Container()),
    );
  }
}
