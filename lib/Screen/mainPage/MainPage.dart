// ignore_for_file: file_names, missing_return
import 'package:admin_smarcap/Screen/Pakages.dart';
import 'package:admin_smarcap/Screen/ReportPage.dart';
import 'package:admin_smarcap/Screen/mainPage/MainPageController.dart';
import 'package:admin_smarcap/Screen/registration.dart';
import 'package:admin_smarcap/Utilities/Constants/AppColors.dart';
import 'package:admin_smarcap/brand_colors.dart';
import 'package:admin_smarcap/globalvariabels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPageView extends GetView<MainPageController> {
  static const String id = 'mainpage';

  const MainPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.main,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: BrandColors.colorBackground,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: BrandColors.colorBackground,
      body: Column(
        children: [
          Center(
            child: Text(
              'google',
              style: Get.textTheme.headline3,
            ),
          )
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.document_scanner_outlined),
              label: 'Report',
            ),
          ],
          currentIndex: controller.selectIndex.value,
          onTap: ((value) {
            controller.selectIndex.value = value;
            print(controller.selectIndex.value);
          }),
          type: BottomNavigationBarType.fixed,
          elevation: 5.0,
          backgroundColor: AppColors.white,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.primaryDark,
          unselectedItemColor: AppColors.greyIcons,
          selectedLabelStyle:
              Get.textTheme.headline6!.copyWith(color: AppColors.primaryDark),
          unselectedLabelStyle:
              Get.textTheme.headline6!.copyWith(color: AppColors.primaryDark),
        ),
      ),
    );
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MainPageController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 60,
          ),
          Container(
            width: 300,
            height: 160,
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(25)),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationPage(
                        approvedDrivers: controller.driverList,
                      ),
                    ),
                  );
                },
                child: Text(
                  'طلبات السائقين',
                  style:
                      Get.textTheme.headline2!.copyWith(color: AppColors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            width: 300,
            height: 160,
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(25)),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Get.to(
                      ReportPage(userData: userData, driverData: driverdata));
                },
                child: Text(
                  'التقارير',
                  style:
                      Get.textTheme.headline2!.copyWith(color: AppColors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            width: 300,
            height: 160,
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(25)),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Pakages(addAmountDrivers)));
                },
                child: Text(
                  'الحزم',
                  style:
                      Get.textTheme.headline2!.copyWith(color: AppColors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
