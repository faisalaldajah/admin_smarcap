// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:admin_smarcap/Model/driver.dart';
import 'package:admin_smarcap/Services/AuthenticationService/Core/manager.dart';
import 'package:admin_smarcap/brand_colors.dart';
import 'package:admin_smarcap/widgets/ProgressDialog.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pakages extends StatefulWidget {
  final List<Driver> addAmountDrivers;

  const Pakages(this.addAmountDrivers);

  @override
  State<Pakages> createState() => _PakagesState();
}

class _PakagesState extends State<Pakages> {
  var checkNumberController = TextEditingController();
  String? analysData;
  // 'Your Money Transfer transaction with amount: JOD15 .000 to 00962798054013 has been accepted. Your current balance is: JOD1.100. Reference :(2921305039551)';
  String? price;
  String? phone;
  String? idNumber;
  String? key;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                analysData = checkNumberController.text;
                for (var k in checkNumberController.text.split(' ')) {
                  if (k.contains('962')) {
                    phone = k;
                    phone = '0${phone!.substring(phone!.indexOf('7'))}';
                  }
                  if (k.contains('(')) {
                    idNumber = k;
                    idNumber = idNumber!.substring(2, idNumber!.indexOf(')'));
                  }
                }
                checkNumberController.clear();
                FocusScope.of(context).unfocus();
                for (int index = 0;
                    index < widget.addAmountDrivers.length;
                    index++) {
                  if (idNumber ==
                          widget.addAmountDrivers[index].amount!.transNumber &&
                      phone == widget.addAmountDrivers[index].phone) {
                    //print(phone);
                    approve(widget.addAmountDrivers[index].id!, context, index);
                  }
                }
              },
              icon: const Icon(
                Icons.done,
                color: Colors.black,
              ))
        ],
        title: TextField(
          controller: checkNumberController,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
              labelText: 'ادخل الرمز',
              labelStyle: TextStyle(
                fontSize: 14.0,
              ),
              hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0)),
          style: const TextStyle(fontSize: 14),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: BrandColors.colorBackground,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: widget.addAmountDrivers.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                '${widget.addAmountDrivers[index].fullname}---${widget.addAmountDrivers[index].phone}',
              ),
              subtitle:
                  Text(widget.addAmountDrivers[index].amount!.transNumber!),
              onTap: () {},
              trailing: Text('${widget.addAmountDrivers[index].amount}JD'),
            );
          },
        ),
      ),
    );
  }

  Future<void> approve(String key, BuildContext context, int index) async {
    final AuthenticationManager authManager = Get.find();
    authManager.commonTools
        .showFailedSnackBar('الرجاء تعبئة الخانة المخصصة لتأكد من المعلومات');
    if (analysData == null) {
      return;
    } else {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => const ProgressDialog(
          status: 'تمت التعبئة بنجاح',
        ),
      );
      if (idNumber == widget.addAmountDrivers[index].amount!.transNumber &&
          phone == widget.addAmountDrivers[index].phone) {
        DatabaseReference driverRef =
            FirebaseDatabase.instance.ref().child('drivers/$key/amount');

        driverRef.child('status').set('approved');
        driverRef
            .child('currentAmount')
            .set(widget.addAmountDrivers[index].amount);
        setState(() {
          widget.addAmountDrivers.removeAt(index);
        });

        Navigator.pop(context);
      } else {
        Navigator.pop(context);
      }
    }
  }
}
