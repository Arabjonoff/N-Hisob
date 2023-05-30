import 'package:flutter/material.dart';
import 'package:n_hisob/src/theme/color/colors.dart';

class DebtScreen extends StatefulWidget {
  const DebtScreen({Key? key}) : super(key: key);

  @override
  State<DebtScreen> createState() => _DebtScreenState();
}

class _DebtScreenState extends State<DebtScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(child: Container()),
    );
  }
}
