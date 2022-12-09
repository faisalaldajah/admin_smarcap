import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardController extends GetxController {
  RxInt currentIndex = 0.obs;
  PageController pageController = PageController();
  final GetStorage globalStorage = GetStorage();
  List<UnbordingContent> contents = [
    UnbordingContent(
        title: 'happy mall',
        image: 'images/Welcome1.png',
        discription:
            'simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the '
            "industry's standard dummy text ever since the 1500s, "
            'when an unknown printer took a galley of type and scrambled it '),
    UnbordingContent(
        title: 'Fast Delevery',
        image: 'images/Welcome2.png',
        discription:
            'simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the '
            "industry's standard dummy text ever since the 1500s, "
            'when an unknown printer took a galley of type and scrambled it '),
    UnbordingContent(
        title: 'Reward surprises',
        image: 'images/Welcome3.png',
        discription:
            'simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the '
            "industry's standard dummy text ever since the 1500s, "
            'when an unknown printer took a galley of type and scrambled it '),
  ].obs;
}

class UnbordingContent {
  String? image;
  String? title;
  String? discription;

  UnbordingContent({this.image, this.title, this.discription});
}
