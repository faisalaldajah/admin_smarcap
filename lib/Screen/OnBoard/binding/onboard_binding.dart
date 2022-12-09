import 'package:admin_smarcap/Screen/OnBoard/controller/onboard_controller.dart';
import 'package:get/get.dart';

class OnBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardController>(
      () => OnBoardController(),
    );
  }
}