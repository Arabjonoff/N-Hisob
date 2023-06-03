
import 'package:flutter/material.dart';
import 'package:n_hisob/src/theme/color/colors.dart';
import 'package:n_hisob/src/theme/font_theme/font_style.dart';
import 'package:n_hisob/src/widget/button/ontap_widget.dart';
import 'package:n_hisob/src/widget/textfield/textfield_widget.dart';

class AddCurrencyDialog{
  static  showAddCurrencyDialog(BuildContext context,controller,date){
    return showDialog(context: context, builder: (builder){
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        actionsPadding: const EdgeInsets.all(0),
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        contentPadding: const EdgeInsets.all(0),
        backgroundColor: AppColor.background,
        title: Text('Kurs qoshish',style: Styles.body(AppColor.textColor),),
        content: SizedBox(
          height: 210,
          child: Column(
            children: [
              TextFieldWidget(controller: TextEditingController(), icon: 'assets/icons/calendar.svg', hint: 'Sanani kiriting',enables: true,),
              TextFieldWidget(controller: controller, icon: 'assets/icons/coin.svg', hint: 'Kursni kiriting',),
              const SizedBox(height: 12,),
              Expanded(child: OnTapWidget(title: 'Davom etsih', onTap: (){}),),
              const SizedBox(height: 12,),
            ],
          ),
        ),
      );
    });
  }
}