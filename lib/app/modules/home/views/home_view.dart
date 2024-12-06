import 'package:flutter/material.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:ussed_manager/app/modules/home/controllers/home_controller.dart';
import 'package:ussed_manager/app/modules/home/views/components/custom_bottom_navigation_bar.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                return controller.gTabs[controller.tabIndex.value];
              }),
            )
          ],
        ),
      ),
    );
  }
}
