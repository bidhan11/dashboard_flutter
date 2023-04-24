import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../model/taskmodel.dart';
import '../view/landingpage.dart';

class TaskListController extends GetxController {
  RxList tasklist = [].obs;
  void addTask(Task task) {
    tasklist.add(task);
  }

  void updateStatus(int id) {
    Task taskToUpdate = tasklist.firstWhere((task) => task.id == id);
    taskToUpdate.status = false;
  }
}
