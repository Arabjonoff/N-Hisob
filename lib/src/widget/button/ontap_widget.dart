

import 'package:flutter/material.dart';
import 'package:n_hisob/src/theme/color/colors.dart';

import '../../utils/utils.dart';

class OnTapWidget extends StatelessWidget {
  final String title;
  bool color;
  bool loading;
  final Function() onTap;
   OnTapWidget({Key? key, required this.title, required this.onTap,this.color = true,this.loading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            backgroundColor: color? AppColor.purple:Colors.red, // Background color
          ),
        // style: ButtonStyle(
        //   backgroundColor:           color: color? AppTheme.purple:Colors.red
        // ),
          onPressed: onTap, child: Container(
        padding:  EdgeInsets.symmetric(vertical: 14*w),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child:
              loading? CircularProgressIndicator.adaptive(backgroundColor: AppColor.white,):
          Text(title,style:  TextStyle(fontSize: 20*w,fontWeight: FontWeight.w600,color: AppColor.white),),
        ),
      )),
    );
  }
}
