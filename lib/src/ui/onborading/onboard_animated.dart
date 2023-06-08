import 'package:flutter/material.dart';
import 'package:n_hisob/src/theme/color/colors.dart';
import 'package:n_hisob/src/ui/onborading/onboarding.dart';
import 'package:n_hisob/src/widget/button/ontap_widget.dart';

import '../../utils/utils.dart';

class OnboardAnimate extends StatefulWidget {
  const OnboardAnimate({Key? key}) : super(key: key);

  @override
  State<OnboardAnimate> createState() => _OnboardAnimateState();
}

class _OnboardAnimateState extends State<OnboardAnimate> {
  PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (int page) {
                setState(() {
                  currentIndex = page;
                });
              },
              controller: _pageController,
              children: const [
                OnBoardingScreen(
                  image: 'assets/icons/onboard2.svg',
                  title: 'O‘zingizga qulay kunni tanlang',
                  subtitle:
                  'O‘zingizga qulay kunni tanlang va band qilib qo‘ying. Barchasi oson va qulay',
                ),
                OnBoardingScreen(
                  image: 'assets/icons/onboard1.svg',
                  title: 'O‘zingizga qulay kunni tanlang',
                  subtitle:
                  'O‘zingizga qulay kunni tanlang va band qilib qo‘ying. Barchasi oson va qulay',
                ),
                OnBoardingScreen(
                  image: 'assets/icons/onboard.svg',
                  title: 'O‘zingizga qulay kunni tanlang',
                  subtitle:
                  'O‘zingizga qulay kunni tanlang va band qilib qo‘ying. Barchasi oson va qulay',
                ),
              ],
            ),),
          Container(
            margin: const EdgeInsets.only(
              bottom: 44,
              left: 25,
              right: 25,
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
          OnTapWidget(title: 'Davom etish',    onTap: () {
            if (currentIndex == 0) {
              setState(() {
                currentIndex = 1;
                _pageController.animateToPage(
                  1,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                // _pageController.jumpToPage(1);
              });
            } else if (currentIndex == 1) {
              setState(() {
                currentIndex = 2;
                _pageController.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                //_pageController.jumpToPage(2);
              });
            } else if (currentIndex == 2) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Container(),
                ),
              );
            }
          },),
          SizedBox(
            height: 34 * h,
          ),
        ],
      ),
    );
  }
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 300),
      height: 9,
      width: isActive ? 28 : 9,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: isActive ? AppColor.purple : AppColor.green,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }

}
