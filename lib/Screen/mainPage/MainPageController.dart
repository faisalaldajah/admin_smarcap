import 'package:admin_smarcap/Model/driver.dart';
import 'package:admin_smarcap/Model/user.dart';
import 'package:admin_smarcap/Services/AuthenticationService/Core/manager.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {
  final AuthenticationManager authManager = Get.find();
  RxList<Driver> driverList = <Driver>[].obs;
  String main = 'الرئيسية';
  RxInt selectIndex = 0.obs;
  @override
  void onInit() async {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    DatabaseReference driverRef =
        FirebaseDatabase.instance.ref().child('drivers');
    DatabaseReference userRef = FirebaseDatabase.instance.ref().child('users');
    // ignore: prefer_typing_uninitialized_variables
    Map<dynamic, dynamic> keys;
    Driver driver;
    UserData user;
    driverRef.once().then((snapshot) {
      keys = snapshot.snapshot.value as Map<dynamic, dynamic>;
      //log(keys.toString());
      keys.forEach((key, values) {
        driver = Driver(
            amount: Amount(
                amount: values['amount']['amount'],
                currentAmount: values['amount']['currentAmount'],
                status: values['amount']['status'],
                transNumber: values['amount']['transNumber']),
            approveDriver: values['approveDriver'],
            carColor: values['carColor'],
            carFactory: values['carFactory'],
            carNumber: values['carNumber'],
            carType: values['carType'],
            driverCarBackImageUrl: values['driverCarBackImageUrl'],
            driverCarFrontImageUrl: values['driverCarFrontImageUrl'],
            driverCarLicenseImageUrl: values['driverCarLicenseImageUrl'],
            driverLicenseImageUrl: values['driverLicenseImageUrl'],
            driversIsAvailable: values['driversIsAvailable'],
            email: values['email'],
            fullname: values['fullname'],
            id: key,
            personalImageUrl: values['personalImageUrl'],
            phone: values['phone'],
            socialAgentNumber: values['socialAgentNumber'],
            token: values['token']);
        driverList.add(driver);
      });
      print(driverList[0].amount!.currentAmount);
    });
  }
}
