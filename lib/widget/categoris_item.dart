import 'package:flutter/material.dart';

class categories_item extends StatelessWidget {
  final String taskcount;
  final String? task;
  final Color linecolor;
  categories_item({
    super.key,
    required this.taskcount,
    this.task,
    required this.linecolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 170,
      decoration: const BoxDecoration(
        color: Color(0xff041955),
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            taskcount,
            style: TextStyle(color: Color(0xff97b4ff)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            task!,
            style: TextStyle(
                color: Color.fromARGB(255, 244, 244, 244),
                fontSize: 25,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          LinearProgressIndicator(
            value: 0.6,
            valueColor: AlwaysStoppedAnimation(linecolor),
            backgroundColor: Color.fromARGB(255, 111, 165, 199),
          )
        ]),
      ),
    );
  }
}
