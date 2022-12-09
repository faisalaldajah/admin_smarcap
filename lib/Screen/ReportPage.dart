// ignore_for_file: file_names, use_key_in_widget_constructors
import 'package:admin_smarcap/Model/driver.dart';
import 'package:admin_smarcap/Model/user.dart';
import 'package:admin_smarcap/widgets/DataViewer.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  static const String id = 'report';
  final List<Driver>? driverData;
  final List<UserData> userData;
  const ReportPage({this.driverData, required this.userData});
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 100),
            DataViewer(
              icon: const Icon(Icons.person),
              title: 'إجمالي المستخدمين',
              total: widget.userData.length,
            ),
            DataViewer(
              icon: const Icon(Icons.car_repair),
              title: 'إجمالي السواقين',
              total: widget.driverData!.length,
            ),
          ],
        ),
      ),
    );
  }
}
