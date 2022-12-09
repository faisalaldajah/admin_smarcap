import 'package:admin_smarcap/Screen/LogIn/login_binding.dart';
import 'package:admin_smarcap/Screen/LogIn/loginpage.dart';
import 'package:admin_smarcap/Screen/OnBoard/controller/onboard_controller.dart';
import 'package:admin_smarcap/Utilities/Constants/AppColors.dart';
import 'package:admin_smarcap/widgets/GreenButton.dart';
import 'package:admin_smarcap/widgets/LanguageWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardView extends GetView<OnBoardController> {
  @override
  Widget build(BuildContext context) {
    //  SignInBinding().dependencies();
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Stack(
            children: [
              PageView.builder(
                controller: controller.pageController,
                itemCount: controller.contents.length,
                onPageChanged: (int index) {
                  controller.currentIndex.value = index;
                },
                itemBuilder: (_, i) {
                  return Stack(
                    children: [
                      Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image:
                                  AssetImage(controller.contents[i].image!),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          children: [
                            const SizedBox(height: 300),
                            Text(controller.contents[i].title!,
                                style: Get.textTheme.headline1!
                                    .copyWith(color: AppColors.white)),
                            const SizedBox(height: 20),
                            Text(controller.contents[i].discription!,
                                textAlign: TextAlign.center,
                                style: Get.textTheme.headline5!
                                    .copyWith(color: AppColors.white))
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.contents.length,
                        (index) => buildDot(index, context),
                      ),
                    ),
                  ),
                  Obx(
                    () => Container(
                      margin: const EdgeInsets.only(
                          bottom: 40, left: 75, right: 75, top: 40),
                      width: double.infinity,
                      child: GreenButton(
                        width: Get.width * 0.8,
                        textColor: controller.currentIndex.value ==
                                controller.contents.length - 1
                            ? AppColors.white
                            : AppColors.primary,
                        backGroundColor: controller.currentIndex.value ==
                                controller.contents.length - 1
                            ? AppColors.primary
                            : AppColors.white,
                        icon: controller.currentIndex.value ==
                                controller.contents.length - 1
                            ? Container()
                            : const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: AppColors.primary,
                              ),
                        onTap: () async {
                          if (controller.currentIndex.value ==
                              controller.contents.length - 1) {
                            Get.offAll(() => const LoginPage(),
                                binding: LogInBinding());
                            await controller.globalStorage
                                .write('firstTimeOpen', true);
                          }
                          controller.pageController.nextPage(
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.decelerate,
                          );
                        },
                        title: controller.currentIndex.value ==
                                controller.contents.length - 1
                            ? 'getStarted'.tr
                            : 'next'.tr,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LanguageWidget(),
                    TextButton(
                        onPressed: () async {
                          Get.offAll(() => const LoginPage(),
                              binding: LogInBinding());
                          await controller.globalStorage
                              .write('firstTimeOpen', true);
                          bool firstTime =
                              controller.globalStorage.read('firstTimeOpen');
                          print(firstTime);
                        },
                        child: Text(
                          'skip'.tr,
                          style: Get.textTheme.headline4!
                              .copyWith(color: AppColors.white),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: controller.currentIndex.value == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
      ),
    );
  }
}
