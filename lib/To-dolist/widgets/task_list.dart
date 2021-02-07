import 'package:flutter/material.dart';
import './task_tile.dart';
import '../models/task.dart';

class TaskWidget extends StatefulWidget {
  final List<Task> tasks;
  TaskWidget(this.tasks);
  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return TaskTileWidget(
          taskTitle: widget.tasks[index].name,
          isChecked: widget.tasks[index].value,
          taskTilecallback: (bool checkboxState) {
            setState(() {
              widget.tasks[index].toggleTask();
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}