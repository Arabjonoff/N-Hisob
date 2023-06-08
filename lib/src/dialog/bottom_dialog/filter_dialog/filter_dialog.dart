import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n_hisob/src/theme/color/colors.dart';
import 'package:n_hisob/src/theme/font_theme/font_style.dart';
import 'package:n_hisob/src/widget/button/ontap_widget.dart';

class ShowFilterBottomSheet {
  static void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      backgroundColor: AppColor.background,
      context: context,
      builder: (ctx) {
        return StatefulBuilder(builder: (context, setState) {
          return  Container(
            margin: EdgeInsets.only(top: 10),
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 300,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 16),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 45,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade100),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/wallet.svg'),
                      const SizedBox(width: 16,),
                      Text(
                        'Hammasi', style: Styles.body(AppColor.textColor),),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(width: 16,),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.white
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/calendar.svg'),
                            const SizedBox(width: 8,),
                            Text('10/10/2002'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16,),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          showDatePicker(context: context,
                            initialDate: DateTime(2020),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2000),);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          alignment: Alignment.center,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.white
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/calendar.svg'),
                              const SizedBox(width: 8,),
                              Text('10/10/2002'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16,),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(child: OnTapWidget(
                      title: "Bekor qilish", onTap: () {}, color: false,),),
                    Expanded(child: OnTapWidget(
                        title: "Ko'satish", onTap: () {}),),
                  ],
                ),
                SizedBox(height: 32,),
              ],
            ),
          );
        });
      },
    );
  }
}