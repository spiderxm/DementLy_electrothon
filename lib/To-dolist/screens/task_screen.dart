import 'package:flutter/material.dart';
import '../widgets/task_list.dart';
import './add_task_screen.dart';
import '../models/task.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(name: 'Bring eggs'),
    Task(name: 'Bring milk'),
    Task(name: 'Finish Assignment'),
    Task(name: 'Get some fruits'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "To-Do List",
          style: TextStyle(fontFamily: 'BalooChettan2'),
        ),
        backgroundColor: Color(0xFFFC5D67),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
            ),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return AddTaskScreen((String newTask) {
                      setState(() {
                        tasks.add(Task(name: newTask));
                      });
                      Navigator.pop(context);
                    });
                  });
            },
          )
        ],
      ),
      backgroundColor: Colors.red.shade100,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Total Tasks : ${tasks.length}',
                  style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFFFC5D67),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2,
                      fontFamily: 'Satisfy'),
                ),
              ),
              SizedBox(
                child: Divider(
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: TaskWidget(tasks),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
