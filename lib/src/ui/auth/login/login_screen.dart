import 'package:flutter/material.dart';
import 'package:n_hisob/src/theme/color/colors.dart';
import 'package:n_hisob/src/widget/button/ontap_widget.dart';
import 'package:n_hisob/src/widget/textfield/textfield_widget.dart';
import '../../../theme/font_theme/font_style.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Column(
              children: [
                const SizedBox(height: 40,),
                Image.asset('assets/icons/logo.png',width: 90,),
                const SizedBox(height: 40,),
                Text('Kirish ',style: Styles.boldH1(AppColor.textColor),),
                const SizedBox(height: 15,),
                SizedBox(
                    width: 298,
                    child: Text('Quyidagi satrga telefon raqamingizni kiriting ',textAlign: TextAlign.center,style: Styles.body(AppColor.textColor),)),
                const SizedBox(height: 30,),
                TextFieldWidget(controller: phoneController, icon: 'assets/icons/call.svg', hint: 'Telfon raqam'),
              ],
            )),
            OnTapWidget(title: 'Davom etish', onTap: (){

            })
          ],
        ),
      ),
    );
  }
}
