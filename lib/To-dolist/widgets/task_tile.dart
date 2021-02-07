import 'package:flutter/material.dart';

class TaskTileWidget extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function taskTilecallback;
  TaskTileWidget({this.isChecked, this.taskTitle, this.taskTilecallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskTitle,
          style: TextStyle(
              fontFamily: 'Satisfy',
              fontSize: 20,
              color: Colors.black87,
              letterSpacing: 1,
              decoration: isChecked ? TextDecoration.lineThrough : null)),
      trailing: Checkbox(
        value: isChecked,
        onChanged: taskTilecallback,
        activeColor: Color(0xFFFC5D67),
      ),
    );
  }
}
