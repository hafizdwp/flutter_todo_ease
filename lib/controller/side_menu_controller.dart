import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenuController extends GetxController {
  RxInt index = 0.obs;

  void selectIndex(int index) {
    this.index.value = index;
    update();
  }

  var pages = [
    Container(
      color: Colors.red,
      child: Text(
        "Tes 1",
        textAlign: TextAlign.center,
      ),
    ),
    Container(
      color: Colors.green,
      child: Text(
        "Tes 2",
        textAlign: TextAlign.center,
      ),
    )
  ];
}
