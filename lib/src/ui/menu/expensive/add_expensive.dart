import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:n_hisob/src/theme/color/colors.dart';
import 'package:n_hisob/src/theme/font_theme/font_style.dart';
import 'package:n_hisob/src/widget/button/ontap_widget.dart';
import 'package:n_hisob/src/widget/textfield/textfield_widget.dart';

class AddExpensiveScreen extends StatefulWidget {
  const AddExpensiveScreen({Key? key}) : super(key: key);

  @override
  State<AddExpensiveScreen> createState() => _AddExpensiveScreenState();
}

class _AddExpensiveScreenState extends State<AddExpensiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        foregroundColor: AppColor.black,
        backgroundColor: AppColor.white,
        title: Text('Harajat qoshish',style: Styles.boldH4(AppColor.textColor),),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: ListView(
              children: [
                const SizedBox(height: 12,),
                GestureDetector(
                    onTap: (){
                      _selectDate(context);
                    },
                    child: TextFieldWidget(controller: TextEditingController(), icon: 'assets/icons/calendar.svg', hint: DateFormat('yyyy-MM-dd').format(selectedDate),enables: false,)),
                TextFieldWidget(controller: TextEditingController(), icon: 'assets/icons/category.svg', hint: 'Harajat turi'),
                TextFieldWidget(controller: TextEditingController(), icon: 'assets/icons/wallet.svg', hint: 'Hamyon'),
                TextFieldWidget(controller: TextEditingController(), icon: 'assets/icons/coin.svg', hint: 'Summa'),
                TextFieldWidget(controller: TextEditingController(), icon: 'assets/icons/message.svg', hint: 'Izoh'),
              ],
            ),),
            OnTapWidget(title: "Davom etish", onTap: (){}),
            const SizedBox(height: 32,),
          ],
        ),
      ),
    );
  }

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

}
