import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              margin: const EdgeInsets.only(top: 30,bottom: 5),
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
            const SizedBox(height: 24,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(15)
              ),
              child: ListTile(
                leading: SvgPicture.asset('assets/icons/wallet.svg'),
                title: Text('Menig hamyonlarim',style: Styles.bodyP(AppColor.textColor, false),),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
            const SizedBox(height: 16,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: ListTile(
                leading: SvgPicture.asset('assets/icons/settings.svg'),
                title: Text('Sozlamalar',style: Styles.bodyP(AppColor.textColor, false),),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
            const SizedBox(height: 16,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: ListTile(
                leading: SvgPicture.asset('assets/icons/comment.svg'),
                title: Text('Yordam',style: Styles.bodyP(AppColor.textColor, false),),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
            const SizedBox(height: 16,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: ListTile(
                leading: SvgPicture.asset('assets/icons/share.svg'),
                title: Text('Ulashish',style: Styles.bodyP(AppColor.textColor, false),),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
            const SizedBox(height: 16,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: ListTile(
                leading: SvgPicture.asset('assets/icons/logout.svg'),
                title: Text('Chiqish',style: Styles.bodyP(AppColor.textColor, false),),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
