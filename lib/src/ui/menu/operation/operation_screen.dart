import 'package:flutter/material.dart';
import 'package:n_hisob/src/ui/menu/expensive/expensive.dart';
import 'package:n_hisob/src/ui/menu/income/income_screen.dart';
import 'package:n_hisob/src/ui/menu/outcome/outcome_screen.dart';

import '../../../theme/color/colors.dart';
import '../../../theme/font_theme/font_style.dart';

class OperationScreen extends StatefulWidget {
  const OperationScreen({Key? key}) : super(key: key);

  @override
  State<OperationScreen> createState() => _OperationScreenState();
}

class _OperationScreenState extends State<OperationScreen> with TickerProviderStateMixin  {
  TabController? _tabBarController;
  List data = [
    'Kirimlar ',
    'Chiqimlar',
    'Xarajatlar',
  ];

  @override
  initState() {
    _tabBarController = TabController(length: data.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.black,
        backgroundColor: AppColor.white,
        centerTitle: true,
        bottom:  PreferredSize(preferredSize: const Size.fromHeight(40),
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.white
          ),
          child: TabBar(
            onTap: (i){
            },
            unselectedLabelColor: AppColor.black.withOpacity(0.5),
            padding: const EdgeInsets.symmetric(vertical: 8),
            isScrollable: true,
            indicatorColor: AppColor.lightPurple,
            labelColor: AppColor.white,
            indicator: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: AppColor.lightPurple,
            ),
            labelStyle: Styles.bodyP(AppColor.textColor,false),
            controller: _tabBarController,
            tabs: data.map((e) {
              return Tab(
                text: e,
              );
            }).toList(),
          ),
        ),),
        title: Text('Monitoring',style: Styles.boldH2(AppColor.textColor),),
      ),
      backgroundColor: AppColor.background,
      body: SafeArea(
          child:TabBarView(
            controller: _tabBarController,
            children: [
              IncomeScreen(),
              OutcomeScreen(),
              ExpensiveScreen(),
            ]
          ),
      ),
    );
  }
}
