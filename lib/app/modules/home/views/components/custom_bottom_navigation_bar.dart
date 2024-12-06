import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ussed_manager/app/modules/home/controllers/home_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({
    super.key,
  });

  final HomeController _homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.h),
          topRight: Radius.circular(25.h),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.h),
      child: GNav(
        gap: 8.h,
        iconSize: 24,
        selectedIndex: _homeController.tabIndex.value,
        onTabChange: (tabIndex) => _homeController.changeTab(tabIndex),
        tabBackgroundColor: Colors.grey.shade600,
        activeColor: Colors.grey.shade50,
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.h),
        duration: Duration(milliseconds: 1000),
        textStyle: GoogleFonts.poppins(
            fontSize: 16.sp, color: Colors.grey.shade50, letterSpacing: 1.2.h),
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.contact_phone_rounded,
            text: 'Phone',
          ),
          // GButton(
          //   icon: Icons.search,
          //   text: 'Search',
          // ),
          // GButton(
          //   icon: Icons.person,
          //   text: 'Profile',
          // )
        ],
      ),
    );
  }
}
