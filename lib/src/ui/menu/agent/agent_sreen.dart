import 'package:flutter/material.dart';
import 'package:n_hisob/src/theme/color/colors.dart';
import 'package:n_hisob/src/theme/font_theme/font_style.dart';
import 'package:n_hisob/src/utils/utils.dart';
import 'package:n_hisob/src/widget/button/ontap_widget.dart';
import 'package:n_hisob/src/widget/textfield/textfield_widget.dart';

class AddAgentScreen extends StatefulWidget {
  const AddAgentScreen({Key? key}) : super(key: key);

  @override
  State<AddAgentScreen> createState() => _AddAgentScreenState();
}

class _AddAgentScreenState extends State<AddAgentScreen> with TickerProviderStateMixin {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController sumController = TextEditingController();
  TabController? _tabBarController;
  TabController? _usdTabBarController;
  List somData = [
    'Som qarzi uchun',
    'Som haqqi uchun',
  ];
  List somUsd = [
    'Dollar qarzi uchun',
    'Dollar haqqi uchun',
  ];

  @override
  initState() {
    _tabBarController = TabController(length: somData.length, vsync: this);
    _usdTabBarController = TabController(length: somData.length, vsync: this);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.black,
        backgroundColor: AppColor.white,
        title: Text("Agent qo'shish",style: Styles.boldH4(AppColor.textColor),),
      ),
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: ListView(
              children: [
                const SizedBox(height: 12,),
                TextFieldWidget(controller: TextEditingController(), icon: 'assets/icons/calendar.svg', hint: 'Sana',enables: false,),
                TextFieldWidget(controller: nameController, icon: 'assets/icons/profile.svg', hint: 'Ismi'),
                TextFieldWidget(controller: phoneController, icon: 'assets/icons/call.svg', hint: 'Telfon raqami',type: true,),
                TextFieldWidget(controller: sumController, icon: 'assets/icons/coin.svg', hint: 'So\'m Qoldiqi',type: true,),
                const SizedBox(height: 12,),
                Container(
                  alignment: Alignment.center,
                  height: 50 * w,
                  margin: EdgeInsets.symmetric(horizontal: 20 * w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.white,
                  ),
                  child: TabBar(
                    onTap: (i) {},
                    unselectedLabelColor: AppColor.black.withOpacity(0.5),
                    isScrollable: true,
                    indicatorColor: AppColor.lightPurple,
                    labelColor: AppColor.white,
                    indicator: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: AppColor.lightPurple,
                    ),
                    labelStyle: Styles.bodyP(AppColor.textColor, false),
                    controller: _tabBarController,
                    tabs: somData.map((e) {
                      return Tab(
                        height: 40,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0 * w),
                          child: Text(e),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 12,),
                TextFieldWidget(controller: sumController, icon: 'assets/icons/coin.svg', hint: '\$ Qoldiqi',type: true,),
                const SizedBox(height: 12,),
                Container(
                  alignment: Alignment.center,
                  height: 50 * w,
                  margin: EdgeInsets.symmetric(horizontal: 20 * w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.white,
                  ),
                  child: TabBar(
                    onTap: (i) {},
                    unselectedLabelColor: AppColor.black.withOpacity(0.5),
                    isScrollable: true,
                    indicatorColor: AppColor.lightPurple,
                    labelColor: AppColor.white,
                    indicator: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: AppColor.lightPurple,
                    ),
                    labelStyle: Styles.bodyP(AppColor.textColor, false),
                    controller: _usdTabBarController,
                    tabs: somUsd.map((e) {
                      return Tab(
                        height: 40,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0 * w),
                          child: Text(e),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 12,),
                TextFieldWidget(controller: commentController, icon: 'assets/icons/message.svg', hint: 'Izohi'),
              ],
            ),),
            OnTapWidget(title: "Davom etish", onTap: (){}),
            const SizedBox(height: 32,),
          ],
        ),
      ),
    );
  }
}
