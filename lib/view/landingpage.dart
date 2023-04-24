import 'package:dashboard/controllers/taskcontroller.dart';
import 'package:dashboard/utils/colors.dart';
import 'package:dashboard/view/addtask.dart';

import 'package:dashboard/widget/tasks_tiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/categoris_item.dart';

class Body extends StatelessWidget {
  static const String routename = "/body";
  final TaskListController _taskListController = Get.find();

  Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 229, 59, 115),
        onPressed: () {
          Get.toNamed(AddTask.routename);
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: const Color(0xff344fa1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: Color(0xff97b4ff),
                          size: 34,
                        ),
                      );
                    },
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  const Icon(
                    Icons.search,
                    size: 34,
                    color: Color(0xff97b4ff),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.notifications_none_rounded,
                    color: Color(0xff97b4ff),
                    size: 34,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 35,
                  ),
                  Text(
                    "What's up Olivia!",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 35,
                  ),
                  Text('CATEGORIES',
                      style: TextStyle(
                          color: Color(0xff97b4ff), letterSpacing: 3)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  categories_item(
                    linecolor: Colors.purple,
                    taskcount: '40 tasks',
                    task: 'Business',
                  ),
                  categories_item(
                    linecolor: const Color.fromARGB(255, 72, 84, 247),
                    taskcount: "18 tasks",
                    task: 'Personal',
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 35.0, top: 40),
              child: Text("TODAY'S TASKS",
                  style: TextStyle(color: Color(0xff97b4ff), letterSpacing: 3)),
            ),
            Container(
              height: 400,
              child: Obx(() => ListView.builder(
                  shrinkWrap: true,
                  itemCount: _taskListController.tasklist.length,
                  itemBuilder: (context, index) {
                    var todotask = _taskListController.tasklist[index];
                    var todoid = todotask.id;
                    var todotitle = todotask.title;
                    var tododescription = todotask.description;
                    var todocategory = todotask.category;
                    var todostatus = todotask.status;
                    return todocategory == "Personal"
                        ? task_tiles(
                            title: todotitle,
                            circle_colors: AppColor.personal,
                            checked: true,
                            id: todoid,
                            description: tododescription,
                            category: todocategory,
                          )
                        : task_tiles(
                            title: todotitle,
                            circle_colors: AppColor.business,
                            checked: true,
                            id: todoid,
                            description: tododescription,
                            category: todocategory,
                          );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
