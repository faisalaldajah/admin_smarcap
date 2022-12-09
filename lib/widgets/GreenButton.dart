import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GreenButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Widget? icon;
  final Color backGroundColor;
  final Color textColor;
  final double width;
  const GreenButton({
    Key? key,
    required this.width,
    required this.onTap,
    required this.title,
    this.icon,
    required this.backGroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: backGroundColor,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: width,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10)),
          child: icon == null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title.tr,
                      style:
                          Get.textTheme.headline4!.copyWith(color: textColor),
                    ),
                    const SizedBox(width: 20),
                    icon!
                  ],
                )
              : Center(
                  child: Text(
                    title.tr,
                    style: Get.textTheme.headline4!.copyWith(color: textColor),
                  ),
                ),
        ),
      ),
    );
  }
}
