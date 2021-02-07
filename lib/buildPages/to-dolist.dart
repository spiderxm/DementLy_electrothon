import 'package:flutter/material.dart';
import '../To-dolist/screens/task_screen.dart';

class ToDoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TasksScreen();
  }
}
    // void delete() {
    //   Firestore.instance.collection('todos').doc(widget.id).delete();
    //   Navigator.of(context).pop();
    //   Fluttertoast.showToast(
    //       msg: "To-Do Successfully Deleted",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.BOTTOM,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.white,
    //       textColor: Colors.black,
    //       fontSize: 16.0);
    // }