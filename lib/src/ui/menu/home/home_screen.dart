import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:n_hisob/src/theme/color/colors.dart';
import 'package:n_hisob/src/theme/font_theme/font_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            card("Hamyon qo'shish", 'assets/icons/wallet.svg', (){}),
            card("Kirim qo'shish", 'assets/icons/money.svg', (){}),
            card("Chiqim qo'shish", 'assets/icons/money_send.svg', (){}),
            card("Xarajat qo'shish", 'assets/icons/receipt.svg', (){}),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget card(title,icons,onTap){
    return SizedBox(
      width: 60,
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  boxShadow:  [
                    BoxShadow(
                        offset: Offset(0,0),
                        blurRadius:12,
                        color: Color.fromRGBO(255, 255, 255, 0.1)
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.white
              ),
              child: Center(child: SvgPicture.asset(icons)),
            ),
          ),
          const SizedBox(height: 10,),
          Text(title,style: Styles.bodyP(AppColor.textColor, false),textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
