import 'package:flutter/material.dart';
import 'package:DementLy/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:speech_recognition/speech_recognition.dart';

class AddTaskScreen extends StatefulWidget {
  final Function addTaskcallback;
  AddTaskScreen(this.addTaskcallback);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String task = "";
  SpeechRecognition _speech;

  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  String transcription = '';

  String _currentLocale = 'en_US';

  final _firestore = FirebaseFirestore.instance;

  void updateToDoScreen() async {
    try {
      await _firestore
          .collection('To-Do_List')
          .doc('${FirebaseAuth.instance.currentUser.uid}${DateTime.now()}')
          .set({
        "taskName": task,
        'isDone': false,
      });
      Fluttertoast.showToast(
          msg: "Task Added Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFFFF6670),
          textColor: Colors.white,
          fontSize: 16.0);
      // Navigator.of(context).pop();
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Task not updated.Try again.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFFFF6670),
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
  void activateSpeechRecognizer() {
    print('_MyAppState.activateSpeechRecognizer... ');
    _speech = new SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    // _speech.setCurrentLocaleHandler(_currentLocale);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech
        .activate()
        .then((res) => setState(() => _speechRecognitionAvailable = res));
  }

  TextEditingController taskController;
  @override
  initState() {
    super.initState();
    activateSpeechRecognizer();
    taskController = new TextEditingController();
  }String newTask = '';
  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: Colors.red.shade100,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: [
                    Text(
                      '     ADD TASK',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'BalooChettan2',
                        color: Color(0xFFFC5D67),
                      ),
                    ),FloatingActionButton(
                      backgroundColor: Color(0xFFFF6670),
                      
                    onPressed: _speechRecognitionAvailable && !_isListening
                        ? () => start()
                        : null,
                    child: Icon(_isListening ? Icons.mic : Icons.mic_none,)),
                  ],
                ),
                SizedBox(
                  child: Divider(
                    color: Colors.black45,
                  ),
                ),
                TextField(
                  controller: taskController,
                  onChanged: (text) {
                  newTask = text;
                },
                  cursorColor: Colors.white,
                  style: TextStyle(
                    color: Colors.black54,
                    decoration: TextDecoration.none,
                    fontFamily: 'BalooChettan2',
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.edit,
                      color: Colors.red.shade200,
                    ),
                    hintText: "Task",
                    hintStyle: TextStyle(color: Colors.red.shade200),
                    fillColor: Colors.red[50],
                    filled: true,
                    border: border,
                    focusedBorder: border,
                    enabledBorder: border,
                    errorBorder: border,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 50,
                  onPressed: () {
                    newTask = taskController.text;
                    widget.addTaskcallback(newTask);
                    updateToDoScreen();
                  },
                  child: Text(
                    'ADD',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'BalooChettan2',
                        fontSize: 20),
                  ),
                  color: Color(0xFFFC5D67),
                ),
              ],
            ),
          )),
    );
  }

 void start() => _speech
      .listen(locale: _currentLocale)
      .then((result) => print('_MyAppState.start => result $result'));

  void cancel() =>
      _speech.cancel().then((result) => setState(() => _isListening = result));

  void stop() =>
      _speech.stop().then((result) => setState(() => _isListening = result));

  void onSpeechAvailability(bool result) {
    setState(() => _speechRecognitionAvailable = result);
    print('onSpeechAvailability result $result');
  }

  void onRecognitionStarted() => setState(() => _isListening = true);

  void onRecognitionResult(String text) {
    setState(() {
      taskController.text = text;
      newTask = text;
    });
    print(text);
  }

  void onRecognitionComplete() => setState(() => _isListening = false);
}
