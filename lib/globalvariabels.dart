import 'package:admin_smarcap/Model/driver.dart';
import 'package:admin_smarcap/Model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

User? currentFirebaseUser;

List<Driver> driverdata = [];
List<UserData> userData = [];
List<Driver> approvedDrivers = [];
List<Driver> addAmountDrivers = [];
