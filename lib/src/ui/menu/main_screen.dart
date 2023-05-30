import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n_hisob/src/theme/color/colors.dart';
import 'package:n_hisob/src/ui/menu/home/home_screen.dart';
import 'package:n_hisob/src/ui/menu/operation/operation_screen.dart';
import 'package:n_hisob/src/ui/menu/profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screen = [HomeScreen(),OperationScreen(),ProfileScreen()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        fixedColor: AppColor.purple,
        currentIndex: currentIndex,
        onTap: (index){
          currentIndex = index;
          setState(() {

          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/home.svg',color: currentIndex == 0?AppColor.purple:Colors.grey,width: 24,),label: 'Asosiy'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/export.svg',color: currentIndex == 1?AppColor.purple:Colors.grey,width: 24,),label: 'Monitoring'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/profile.svg',color: currentIndex == 2?AppColor.purple:Colors.grey,width: 24,),label: 'Profile'),
        ],
      ),
    );
  }
}
