import 'package:flutter/material.dart';
import 'package:n_hisob/src/theme/color/colors.dart';

class CostScreen extends StatefulWidget {
  const CostScreen({Key? key}) : super(key: key);

  @override
  State<CostScreen> createState() => _CostScreenState();
}

class _CostScreenState extends State<CostScreen> {
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
