// ignore_for_file: use_key_in_widget_constructors

import 'package:admin_smarcap/Model/driver.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:admin_smarcap/brand_colors.dart';

class RegistrationPage extends StatefulWidget {
  static const String id = 'register';
  final List<Driver>? approvedDrivers;
  const RegistrationPage({this.approvedDrivers});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
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
        title: const Text('data'),
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
          itemCount: widget.approvedDrivers!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                '${widget.approvedDrivers![index].fullname} ----- ${widget.approvedDrivers![index].approveDriver}',
              ),
              subtitle: Text(
                  'Car number: ${widget.approvedDrivers![index].carNumber}'),
              onTap: () async {
                final result = await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => ConfirmSheet(
                    driverData: widget.approvedDrivers![index],
                  ),
                );
                if (result == 'delete') {
                  setState(() {
                    widget.approvedDrivers!.removeAt(index);
                  });
                }
              },
              trailing: Text('${widget.approvedDrivers![index].amount}JD'),
            );
          },
        ),
      ),
    );
  }
}

class ConfirmSheet extends StatelessWidget {
  final Driver? driverData;
  const ConfirmSheet({this.driverData});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      backgroundColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'هل توافق على بيانات السائق',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      DatabaseReference driverRef1 = FirebaseDatabase.instance
                          .ref()
                          .child('drivers/${driverData!.id}');
                      driverRef1.child('approveDriver').set('false');
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Reject ',
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      DatabaseReference driverRef1 = FirebaseDatabase.instance
                          .ref()
                          .child('drivers/${driverData!.id}');
                      driverRef1.child('approveDriver').set('true');
                      DatabaseReference driverRef = FirebaseDatabase.instance
                          .ref()
                          .child('approveDriver');
                      driverRef.child(driverData!.id!).remove();
                      Navigator.pop(context, 'delete');
                    },
                    child: const Text(
                      'Accept',
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
