import 'package:flutter/material.dart';
import 'package:todo_app/common/app_color.dart';

class TodoItemScreen extends StatefulWidget {
  const TodoItemScreen(
      {super.key, required this.todoTitle, required this.todoDescription});

  final String todoTitle;
  final String todoDescription;

  @override
  State<TodoItemScreen> createState() => _TodoItemScreenState();
}

class _TodoItemScreenState extends State<TodoItemScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: 160,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.todoItemColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// This is todo title
          Text(
            widget.todoTitle,
            style: const TextStyle(
              color: AppColor.textColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: height * 0.02),

          /// This is todo subtitle
          Text(
            widget.todoDescription,
            maxLines: 2,
            style: const TextStyle(
              color: AppColor.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
