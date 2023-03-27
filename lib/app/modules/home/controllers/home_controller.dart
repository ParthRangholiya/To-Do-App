import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController valueController = TextEditingController();

  RxList data = [].obs;

  RxList checkbox = [].obs;

  void insertData() {
    data.add(valueController.text);
    checkbox.add(false);
    debugPrint("===================$data");
    valueController.clear();
  }

  void deletedata(int index) {
    data.removeAt(index);
    checkbox.removeAt(index);
  }
}
