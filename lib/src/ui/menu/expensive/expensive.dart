import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:n_hisob/src/theme/color/colors.dart';

import '../../../dialog/bottom_dialog/filter_dialog/filter_dialog.dart';
import '../../../theme/font_theme/font_style.dart';

class ExpensiveScreen extends StatefulWidget {
  const ExpensiveScreen({Key? key}) : super(key: key);

  @override
  State<ExpensiveScreen> createState() => _ExpensiveScreenState();
}

class _ExpensiveScreenState extends State<ExpensiveScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 58.0),
        child: FloatingActionButton(
          heroTag: 'expensive',
          backgroundColor: AppColor.lightPurple,
          onPressed: (){
            ShowFilterBottomSheet.showFilterBottomSheet(context);
          },
          child: SvgPicture.asset('assets/icons/filter.svg',color: AppColor.white,),
        ),
      ),
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (ctx,index){
                    return  Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: AppColor.background),
                        ),
                      ),
                      height: 50,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset('assets/icons/receipt.svg',color: AppColor.lightPurple,),
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.only(bottom: 16,left: 16,right: 16),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.lightPurple
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Umumiy',style: Styles.bodyP(AppColor.white, false),),
                  Text('7 202 001 som',style: Styles.bodyP(AppColor.white, false),),
                ],
              ),
            )
          ],
        ),),
    );
  }
}
