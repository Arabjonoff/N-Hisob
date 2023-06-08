import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n_hisob/src/theme/color/colors.dart';

class OnBoardingScreen extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const OnBoardingScreen({Key? key, required this.image, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Column(
          children: [
            SvgPicture.asset(image),
            Text(title),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}
