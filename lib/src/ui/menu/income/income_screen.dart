import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:n_hisob/src/theme/color/colors.dart';
import 'package:n_hisob/src/theme/font_theme/font_style.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({Key? key}) : super(key: key);

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      endDrawer: Drawer(
        child: SafeArea(child: Text('sxxsx')),
      ),
      appBar: AppBar(
        foregroundColor: AppColor.black,
        backgroundColor: AppColor.white,
        centerTitle: true,
        title: Text('Kirimlar',style: Styles.boldH2(AppColor.textColor),),
      ),
      backgroundColor: AppColor.background,

    );
  }
}
