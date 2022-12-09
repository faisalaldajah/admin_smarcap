import 'package:admin_smarcap/Screen/splash/splash_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.waitingView();
  }
}
