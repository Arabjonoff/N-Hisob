import 'package:flutter/material.dart';
import 'package:n_hisob/src/theme/color/colors.dart';
import 'package:n_hisob/src/theme/font_theme/font_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,
        title: Text('Profile',style: Styles.boldH2(AppColor.textColor),),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColor.white
              ),
              child: Text('M',style: Styles.boldH1(AppColor.textColor),),
            ),
            Text('Muhammad Ali',style: Styles.body(AppColor.textColor),),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
            )
          ],
        ),
      ),
    );
  }
}
