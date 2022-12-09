import 'package:admin_smarcap/Services/AuthenticationService/Core/cache.dart';
import 'package:admin_smarcap/Utilities/Constants/tools.dart';
import 'package:admin_smarcap/Utilities/Methods/tools.dart';
import 'package:get/get.dart';

class AuthenticationManager extends GetxController with CacheManager {
  final CommonTools commonTools = CommonTools();
  final DeliveryTools deliveryTools = DeliveryTools();
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
  }

  void login(String token) async {
    isLogged.value = true;
    //Token is cached
    await saveToken(token);
  }
}
