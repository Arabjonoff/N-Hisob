import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:n_hisob/src/theme/color/colors.dart';
import 'package:n_hisob/src/theme/font_theme/font_style.dart';
import 'package:n_hisob/src/widget/button/ontap_widget.dart';
import 'package:n_hisob/src/widget/textfield/textfield_widget.dart';

import '../../../utils/utils.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}




class _WalletScreenState extends State<WalletScreen> {
  final PageController _pageController = PageController();
  @override
  void initState() {
    dropDownValue = items[0];
    super.initState();
  }
  List<String> images = ['assets/icons/001.png','assets/icons/002.png','assets/icons/005.png','assets/icons/004.png'];
  String dropDownValue = "Valyuta turi";
  List<String> items = ["So'm","Dollar",];

  int indicator = 0;

  TextEditingController cardController = TextEditingController();
  TextEditingController cardSumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,
        foregroundColor: AppColor.black,
        title: Text(
          "Hamyon qo'shish",
          style: Styles.boldH2(AppColor.textColor),
        ),
      ),
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                const SizedBox(height: 24,),
                TextFieldWidget(
                    controller: cardController,
                    icon: 'assets/icons/wallet.svg',
                    hint: 'Hamyon nomi'),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin: EdgeInsets.symmetric(horizontal: 20*w,vertical: 10),
                  height: 50*w,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 15,
                            offset: Offset(4, 15),
                            color: Color.fromRGBO(255, 255, 255, 0.1)),
                      ],
                      color: AppColor.white),
                  child: Row(children: [
                    SvgPicture.asset('assets/icons/sum.svg'),
                    const SizedBox(width: 14,),
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          value: dropDownValue,
                          onChanged: (newValue) {
                            setState(() {
                              dropDownValue = newValue!;
                            });
                          },
                          items: items.map((i) {
                            return DropdownMenuItem(
                              value: i,
                              child: Text(
                                i,
                                style: Styles.bodyP(AppColor.textColor, false),
                              ),
                            );
                          }).toList(),

                        ),
                      ),
                    ),
                  ],)
                ),
                TextFieldWidget(
                    controller: cardSumController,
                    icon: 'assets/icons/coin.svg',
                    hint: 'Summa'),
                SizedBox(
                  height: 150,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: images.length,
                      onPageChanged: (i){

                       setState(() {
                         indicator = i;
                       });
                      },
                      itemBuilder: (ctx,index){
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(images[index],fit: BoxFit.cover,)),
                    );
                  }),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 44,
                    left: 25,
                    right: 25,
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildIndicator(),
                  ),
                )
              ],
            ),),
            OnTapWidget(title: 'Davom etish', onTap: (){}),
            const SizedBox(height: 32,),
          ],
        ),
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
        color: isActive ? AppColor.lightPurple : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < images.length; i++) {
      if (indicator == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
