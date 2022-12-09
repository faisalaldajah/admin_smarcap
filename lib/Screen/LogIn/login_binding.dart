import 'package:admin_smarcap/Screen/LogIn/login_controller.dart';
import 'package:admin_smarcap/Services/AuthenticationService/Core/manager.dart';
import 'package:get/get.dart';

class LogInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogInController>(() => LogInController());
    Get.lazyPut<AuthenticationManager>(() => AuthenticationManager());
  }
}
