import 'package:dashboard/controllers/dropdowncontroller.dart';
import 'package:dashboard/controllers/taskcontroller.dart';
import 'package:dashboard/controllers/textcontroller.dart';
import 'package:dashboard/view/addtask.dart';
import 'package:dashboard/view/landingpage.dart';

import 'package:get/get.dart';

var approutes = [
  GetPage(
    name: AddTask.routename,
    page: () => AddTask(),
    binding: BindingsBuilder(() {
      // Get.lazyPut(() => TextBoxController());
      // Get.lazyPut(() => TaskListController());
      // Get.lazyPut(() => DropDownController());
      Get.put(TextBoxController());
      Get.put(TaskListController());
      Get.put(DropDownController());
    }),
  ),
  GetPage(
    name: Body.routename,
    page: () => Body(),
  ),
];
