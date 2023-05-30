import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n_hisob/src/theme/color/colors.dart';
import 'package:n_hisob/src/theme/font_theme/font_style.dart';
import 'package:n_hisob/src/widget/textfield/textfield_widget.dart';

import '../../../utils/utils.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}




class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    dropdownvalue = items[0];
    super.initState();
  }
  String dropdownvalue = "Valyuta turi";
  List<String> items = ["So'm","Dollar",];

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
                child: Column(
              children: [
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
                    SizedBox(width: 14,),
                    Expanded(
                      child: DropdownButton(
                        isExpanded: true,
                        value: dropdownvalue,
                        onChanged: (newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                        items: items.map((i) {
                          return DropdownMenuItem(
                            value: i,
                            child: Text(
                              i,
                              style: Styles.bodyP(AppColor.textColor, true),
                            ),
                          );
                        }).toList(),

                      ),
                    ),
                  ],)
                ),
                TextFieldWidget(
                    controller: cardController,
                    icon: 'assets/icons/coin.svg',
                    hint: 'Summa'),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
