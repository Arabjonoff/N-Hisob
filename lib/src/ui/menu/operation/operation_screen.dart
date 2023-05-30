import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';

import '../../../theme/color/colors.dart';
import '../../../theme/font_theme/font_style.dart';

class OperationScreen extends StatefulWidget {
  const OperationScreen({Key? key}) : super(key: key);

  @override
  State<OperationScreen> createState() => _OperationScreenState();
}

class _OperationScreenState extends State<OperationScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      endDrawer: Drawer(
        child: SafeArea(child: Text('sxxsx')),
      ),
      appBar: AppBar(
        foregroundColor: AppColor.black,
        backgroundColor: AppColor.white,
        centerTitle: true,
        title: Text('Monitoring',style: Styles.boldH2(AppColor.textColor),),
      ),
      backgroundColor: AppColor.background,
      body: SafeArea(
          child:Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.white
                ),
                child: Row(
                  children: [
                    Container(
                      child: Text('Kirimlar',style: Styles.bodyP(AppColor.textColor, false),),
                      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5)
                      ),

                    ),
                    Container(
                      child: Text('Chiqimlar',style: Styles.bodyP(AppColor.textColor, false),),
                      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),

                    ),
                    Container(
                      child: Text('Xarjatlar',style: Styles.bodyP(AppColor.white, false),),
                      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        color: AppColor.lightPurple,

                      ),
                    ),
                  ],
                ),
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
          )
      ),
    );
  }
}
