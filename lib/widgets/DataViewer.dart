// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:admin_smarcap/Utilities/Constants/AppColors.dart';
import 'package:flutter/material.dart';

import '../brand_colors.dart';

class DataViewer extends StatelessWidget {
  final int? total;
  final String? title;
  final Icon? icon;
  const DataViewer({
    this.icon,
    this.title,
    this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 150,
            decoration: const BoxDecoration(
              color: BrandColors.colorBackground,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Center(
              child: Icon(
                icon!.icon,
                color: AppColors.primary,
                size: 70,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  total.toString(),
                  style: const TextStyle(
                    color: BrandColors.colorBackground,
                    fontFamily: 'JF-Flat-regular',
                    fontSize: 30,
                  ),
                ),
                Text(
                  title!,
                  style: const TextStyle(
                    color: BrandColors.colorBackground,
                    fontFamily: 'JF-Flat-regular',
                    fontSize: 20,
                  ),
                  maxLines: 4,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
