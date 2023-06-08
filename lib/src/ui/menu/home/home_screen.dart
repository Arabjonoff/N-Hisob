import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n_hisob/src/theme/color/colors.dart';
import 'package:n_hisob/src/theme/font_theme/font_style.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 32),
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColor.lightPurple
              ),
              child: TextButton(child: Text('Hamyon qoshish',style: Styles.body(AppColor.white),),onPressed: ()=>Navigator.pushNamed(context, '/wallet'),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            card("Agent qo'shish", 'assets/icons/users.svg', () => Navigator.pushNamed(context, '/addAgent')),
            card("Kirim qo'shish", 'assets/icons/money.svg', () => Navigator.pushNamed(context, '/income')),
            card("Chiqim qo'shish", 'assets/icons/money_send.svg', ()=>Navigator.pushNamed(context, '/addOutcome')),
            card("Xarajat qo'shish", 'assets/icons/receipt.svg', ()=>Navigator.pushNamed(context, '/addExpensive')),
              ],
            ),
            const SizedBox(height: 36,),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,bottom: 15),
              child: Text('Oxirgi 7 kungi tarixilar',style: Styles.bodyP(AppColor.textColor,false),),
            ),

           Expanded(
             child: Container(
               margin: const EdgeInsets.symmetric(horizontal: 10),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 color: Colors.white
               ),
               child: ListView.builder(
                   itemCount: 20,
                   itemBuilder: (ctx,index){
                 return  Container(
                   width: MediaQuery.of(context).size.width,
                   decoration: BoxDecoration(
                     border: Border(
                       bottom: BorderSide(width: 1.0, color: AppColor.background),
                 ),
                   ),
                   height: 50,
                   child: Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: SvgPicture.asset('assets/icons/money.svg',color: AppColor.purple,),
                       ),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Abdulloh aka Usta ',style: Styles.bodyP(AppColor.textColor, false),),
                           Text('20/04/2023 ',style: TextStyle(fontSize: 12,color: Colors.grey),),
                         ],
                       ),
                       const Spacer(),
                       Text('300 000 som ',style: Styles.bodyP(AppColor.green, false),),
                       const SizedBox(width: 16,)
                     ],
                   ),
                 );
               }),
             ),
           )
          ],
        ),
      ),
    );
  }
  Widget card(title,icons,onTap){
    return SizedBox(
      width: 60,
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  boxShadow:  [
                    BoxShadow(
                        offset: Offset(0,0),
                        blurRadius:12,
                        color: Color.fromRGBO(255, 255, 255, 0.1)
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.lightPurple
              ),
              child: Center(child: SvgPicture.asset(icons,color: AppColor.white,)),
            ),
          ),
          const SizedBox(height: 10,),
          Text(title,style: Styles.bodyP(AppColor.textColor, false),textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}