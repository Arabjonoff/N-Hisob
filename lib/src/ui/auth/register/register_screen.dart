import 'package:flutter/material.dart';
import 'package:n_hisob/src/theme/color/colors.dart';
import 'package:n_hisob/src/widget/button/ontap_widget.dart';
import 'package:n_hisob/src/widget/textfield/textfield_widget.dart';
import '../../../theme/font_theme/font_style.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40,),
                  Image.asset('assets/icons/logo.png',width: 90,),
                  const SizedBox(height: 40,),
                  Text('Ro‘yxatdan o‘tish ',style: Styles.boldH1(AppColor.textColor),),
                  const SizedBox(height: 15,),
                  SizedBox(
                    width: 298,
                      child: Text('Avtorizatsiya qilish uchun quyidagi satrlarga ma’lumotlaringizni kiriting',style: Styles.body(AppColor.textColor),)),
                  const SizedBox(height: 30,),
                  TextFieldWidget(controller: nameController, icon: 'assets/icons/profile.svg', hint: 'Ism'),
                  TextFieldWidget(controller: surnameController, icon: 'assets/icons/profile.svg', hint: 'Familya'),
                  TextFieldWidget(controller: phoneController, icon: 'assets/icons/call.svg', hint: 'Telfon raqam'),
                ],
              ),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Accauntingiz bormi ?',
                  style: Styles.bodyP(AppColor.textColor,false),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    'Kirish',
                    style: Styles.bodyP(AppColor.purple,true),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            OnTapWidget(title: 'Davom etish', onTap: (){
              Navigator.pushNamed(context, '/login');
            }),
            const SizedBox(height: 32,),
          ],
        ),
      ),
    );
  }
}
