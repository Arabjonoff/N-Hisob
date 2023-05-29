import 'package:flutter/material.dart';
import 'package:n_hisob/src/theme/color/colors.dart';
import 'package:n_hisob/src/theme/font_theme/font_style.dart';
import 'package:n_hisob/src/widget/button/ontap_widget.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

TextEditingController pinController = TextEditingController();

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Kirish',
                    style: Styles.boldH1(AppColor.textColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      width: 298,
                      child: Text(
                        'Telefon raqamingizga sms kod jo‘natildi',
                        textAlign: TextAlign.center,
                        style: Styles.body(AppColor.textColor),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Pinput(
                    length: 5,
                    androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                    controller: pinController,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Kod kelmadimi ?',
                  style: Styles.bodyP(AppColor.textColor,false),
                ),
                TextButton(
                  onPressed: (){},
                  child: Text(
                    ' Qaytadan jo‘natish',
                    style: Styles.bodyP(AppColor.purple,true),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            OnTapWidget(title: 'Davom etish', onTap: () {
              Navigator.pushNamed(context, '/home');
            }),
            const SizedBox(
              height: 32,
            )
          ],
        ),
      ),
    );
  }

  final defaultPinTheme = PinTheme(
    width: 50,
    height: 50,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
