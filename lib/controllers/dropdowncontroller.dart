import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownController extends GetxController {
  var initialValue = "Business".obs;

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Business", child: Text("Business")),
      const DropdownMenuItem(value: "Personal", child: Text("Personal")),
    ];
    return menuItems;
  }

  onChange(String? value) {
    initialValue.value = value!;
  }
}
