import 'package:dashboard/controllers/taskcontroller.dart';
import 'package:dashboard/utils/colors.dart';
import 'package:dashboard/view/addtask.dart';
import 'package:dashboard/view/landingpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class task_tiles extends StatelessWidget {
  final String title;
  final Color circle_colors;
  final bool checked;
  final int id;
  final String description;
  final String category;
  final TaskListController _taskListController = Get.find();
  task_tiles({
    super.key,
    required this.title,
    required this.circle_colors,
    required this.checked,
    required this.id,
    required this.description,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    var status;
    if (checked == false) {
      status = "Complete";
    } else {
      status = "Incomplete";
    }
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Center(
                      child: Text(
                        "TASK DESCRIPTION",
                        style: TextStyle(
                            color: AppColor.textcolor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30, right: 85),
                        child: ElevatedButton(
                          onPressed: () {
                            _taskListController.updateStatus(id);
                            Get.back();
                          },
                          // ignore: sort_child_properties_last
                          child: const Text("COMPLETE"),
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  AppColor.buttoncolor)),
                        ),
                      )
                    ],
                    backgroundColor: const Color.fromARGB(255, 62, 93, 187),
                    content: SizedBox(
                      height: 180,
                      width: 230,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  "Title-",
                                  style: TextStyle(
                                      color: AppColor.textcolor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Description-",
                                  style: TextStyle(
                                      color: AppColor.textcolor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Category-",
                                  style: TextStyle(
                                      color: AppColor.textcolor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Status-",
                                  style: TextStyle(
                                      color: AppColor.textcolor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ]),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  title,
                                  style: const TextStyle(
                                      color: AppColor.textcolor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  description,
                                  style: const TextStyle(
                                      color: AppColor.textcolor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  category,
                                  style: const TextStyle(
                                      color: AppColor.textcolor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  status,
                                  style: const TextStyle(
                                      color: AppColor.textcolor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Container(
            height: 60,
            width: 340,
            decoration: const BoxDecoration(
                color: Color(0xff041955),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                checked == true
                    ? Obx(() => Icon(
                          Icons.circle_outlined,
                          color: circle_colors,
                          size: 40,
                        ))
                    : const Icon(
                        Icons.check_circle,
                        size: 40,
                        color: Color(0xff183588),
                      ),
                const SizedBox(
                  width: 40,
                ),
                checked == true
                    ? Text(
                        title.toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )
                    : Text(
                        title.toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.lineThrough),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
