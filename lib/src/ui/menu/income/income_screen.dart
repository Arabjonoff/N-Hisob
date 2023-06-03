import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:n_hisob/src/theme/color/colors.dart';
import 'package:n_hisob/src/theme/font_theme/font_style.dart';
import 'package:n_hisob/src/utils/utils.dart';
import 'package:n_hisob/src/widget/button/ontap_widget.dart';
import 'package:n_hisob/src/widget/textfield/textfield_widget.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({Key? key}) : super(key: key);

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen>
    with TickerProviderStateMixin {
  TextEditingController controller = TextEditingController();
  TextEditingController sumController = TextEditingController();
  TabController? _tabBarController;
  List data = [
    'Som uchun  ',
    'Dolla ruchun ',
  ];

  String date = 'Sana',
      agent = 'Agent',
      wallet = 'Hamyon',
      course = 'Bugungi kurs';

  @override
  initState() {
    _tabBarController = TabController(length: data.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.getHeight(context);
    double w = Utils.getWidth(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.black,
        backgroundColor: AppColor.white,
        centerTitle: true,
        title: Text(
          'Kirim qoshish',
          style: Styles.boldH2(AppColor.textColor),
        ),
      ),
      backgroundColor: AppColor.background,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 12 * h,
                ),
                GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: TextFieldWidget(
                      controller: controller,
                      icon: 'assets/icons/calendar.svg',
                      hint: DateFormat('yyyy-MM-dd').format(selectedDate),
                      enables: false,
                    )),
                TextFieldWidget(
                  controller: controller,
                  icon: 'assets/icons/profile.svg',
                  hint: agent,
                  enables: false,
                ),
                TextFieldWidget(
                  controller: controller,
                  icon: 'assets/icons/wallet.svg',
                  hint: wallet,
                  enables: false,
                ),
                TextFieldWidget(
                  controller: controller,
                  icon: 'assets/icons/sum.svg',
                  hint: course,
                  enables: false,
                ),
                TextFieldWidget(
                  controller: sumController,
                  icon: 'assets/icons/coin.svg',
                  hint: 'Summa',
                ),
                SizedBox(
                  height: 12 * h,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 50 * w,
                  margin: EdgeInsets.symmetric(horizontal: 20 * w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.white,
                  ),
                  child: TabBar(
                    onTap: (i) {},
                    unselectedLabelColor: AppColor.black.withOpacity(0.5),
                    isScrollable: true,
                    indicatorColor: AppColor.lightPurple,
                    labelColor: AppColor.white,
                    indicator: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: AppColor.lightPurple,
                    ),
                    labelStyle: Styles.bodyP(AppColor.textColor, false),
                    controller: _tabBarController,
                    tabs: data.map((e) {
                      return Tab(
                        height: 40,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0 * w),
                          child: Text(e),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 12 * h,
                ),
                TextFieldWidget(
                  controller: sumController,
                  icon: 'assets/icons/money.svg',
                  hint: 'Qabul qilindi',
                  currencyType: '123 000 som',
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: OnTapWidget(
                  title: 'Bekor qilish',
                  onTap: () {
                    Navigator.pop(context);
                  },
                  color: false,
                ),
              ),
              Expanded(child: OnTapWidget(title: 'Davom etsih', onTap: () {})),
            ],
          ),
          SizedBox(
            height: 32 * w,
          )
        ],
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
