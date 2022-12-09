// ignore_for_file: file_names

import 'package:admin_smarcap/Screen/SignUp/SignUp_controller.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
