import 'package:dashboard/controllers/taskcontroller.dart';
import 'package:dashboard/controllers/dropdowncontroller.dart';
import 'package:dashboard/model/taskmodel.dart';
import 'package:dashboard/utils/colors.dart';
import 'package:dashboard/view/landingpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dashboard/controllers/textcontroller.dart';

class AddTask extends StatelessWidget {
  AddTask({super.key});
  static const String routename = "/addtask";
  String initial = "Business";
  RxString selectedValue = "Business".obs;
  final TextBoxController controller = Get.find();
  final TaskListController _taskListController = Get.find();
  final DropDownController _dropDownConntroller = Get.find();
  @override
  Widget build(BuildContext context) {
    final TaskListController taskController = Get.find();
    return Scaffold(
      backgroundColor: const Color(0xff344fa1),
      appBar: AppBar(
        backgroundColor: AppColor.appcolor,
        centerTitle: true,
        title: const Text(
          'Add a task',
          style: TextStyle(
              color: AppColor.textcolor,
              fontSize: 40,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 15, right: 15),
              child: TextField(
                controller: controller.control1,
                autofocus: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xff183588),
                  border: OutlineInputBorder(),
                  label: Text(
                    'Title',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 15, right: 15),
              child: TextField(
                controller: controller.control2,
                autofocus: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: AppColor.fillcolor,
                  border: OutlineInputBorder(),
                  label: Text(
                    'Description',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 15, right: 15),
              child: SizedBox(
                width: 200,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(() => DropdownButton(
                            dropdownColor: AppColor.fillcolor,
                            icon: const Padding(
                              padding: EdgeInsets.only(left: 25.0),
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: AppColor.iconcolor,
                                size: 30,
                              ),
                            ),
                            style: const TextStyle(
                                color: AppColor.textcolor, fontSize: 17),
                            items: _dropDownConntroller.dropdownItems,
                            value: selectedValue.value,
                            onChanged: (String? newvalue) {
                              selectedValue.value = newvalue!;
                            },
                          )),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Task newTask = Task(
                      id: taskController.tasklist.length + 1,
                      title: controller.control1.text,
                      description: controller.control2.text,
                      status: false,
                      category: selectedValue.value,
                    );
                    _taskListController.addTask(newTask);
                    Get.back();
                  },
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(AppColor.buttoncolor)),
                  child: const Text("Add Task"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
