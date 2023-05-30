import 'package:flutter/material.dart';
import 'package:n_hisob/src/theme/color/colors.dart';
import 'package:n_hisob/src/theme/font_theme/font_style.dart';
import 'package:n_hisob/src/widget/textfield/textfield_widget.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({Key? key}) : super(key: key);

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {

  TextEditingController controller = TextEditingController();
  TextEditingController sumController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.black,
        backgroundColor: AppColor.white,
        centerTitle: true,
        title: Text('Kirim qoshish',style: Styles.boldH2(AppColor.textColor),),
      ),
      backgroundColor: AppColor.background,
      body: ListView(
        children: [
          TextFieldWidget(controller: controller, icon: 'assets/icons/calendar.svg', hint: 'Sana',enables: false,),
          TextFieldWidget(controller: controller, icon: 'assets/icons/profile.svg', hint: 'Agent',enables: false,),
          TextFieldWidget(controller: controller, icon: 'assets/icons/wallet.svg', hint: 'Hamyon',enables: false,),
          TextFieldWidget(controller: controller, icon: 'assets/icons/sum.svg', hint: 'Bugungi kurs',enables: false,),
          TextFieldWidget(controller: sumController, icon: 'assets/icons/coin.svg', hint: 'Summa',),
        ],
      ),
    );
  }
}
