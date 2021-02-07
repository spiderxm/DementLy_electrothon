import 'package:flutter/material.dart';
import '../constants.dart';
// import 'mainScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import './googleSign.dart';
//import 'package:firebase_storage/firebase_storage.dart';
// import 'package:Demently/ProfileUploader.dart';

User user = FirebaseAuth.instance.currentUser;
String userId = user.uid;
final _firestore = FirebaseFirestore.instance;
String imageURL;

final ImagePicker _picker = ImagePicker();
var img;

class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

final nameController = TextEditingController();
final ageController = TextEditingController();
final sexController = TextEditingController();
final addressController = TextEditingController();

PickedFile imageFile;


class _UserDetailsState extends State<UserDetails> {
  final _formKey = GlobalKey<FormState>();

  void updateProfile() async {
    bool valid = _formKey.currentState.validate();
    if (!valid) return;
    try {
      await _firestore.collection('UserProfile').doc(userId).set({
        "name": nameController.text,
        "age": ageController.text,
        "gender": sexController.text,
        "address": addressController.text,
        "image_url": imageURL,
      });
      Fluttertoast.showToast(
          msg: "Profile Updated Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFFFF6670),
          textColor: Colors.white,
          fontSize: 16.0);
      // Navigator.of(context).pop();
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: "There is some error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFFFF6670),
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.red.shade100,
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 16,
                  left: 30,
                  right: 30,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 10),
              child: Center(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "PERSONAL DETAILS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFFFF6670),
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Mirza'),
                    ),
                    Divider(
                      color: Colors.black38,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: imageFile == null
                                ? AssetImage('assets/images/default-dp.png')
                                : FileImage(File(imageFile.path)),
                            radius: 60,
                          ),
                          Positioned(
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: ((builder) {
                                      return Dialog(
                                        child: Container(
                                          height: 100,
                                          child: Column(
                                            children: [
                                              FlatButton.icon(
                                                icon: Icon(
                                                    Icons.camera_alt_sharp),
                                                onPressed: () {
                                                  _pickImage(
                                                      ImageSource.camera);
                                                  Navigator.pop(context);
                                                },
                                                label: Text('Camera'),
                                              ),
                                              FlatButton.icon(
                                                  icon:
                                                      Icon(Icons.image_search),
                                                  onPressed: () {
                                                    _pickImage(
                                                        ImageSource.gallery);
                                                    Navigator.pop(context);
                                                  },
                                                  label: Text('Gallery'))
                                            ],
                                          ),
                                        ),
                                      );
                                    }));
                                // showBottomSheet(
                                //   backgroundColor: Color(0xFFFF9097),
                                //   context: context,
                                //   builder: ((builder) {
                                //     return ImageCapture();
                                //   }),
                                // );
                              },
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.red.shade100,
                              ),
                            ),
                            bottom: 8,
                            right: 48,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            cursorColor: Colors.white,
                            style: TextStyle(
                              color: Colors.black54,
                              decoration: TextDecoration.none,
                              fontFamily: 'BalooChettan2',
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.supervised_user_circle_sharp,
                                color: Colors.red.shade200,
                              ),
                              hintText: "Name",
                              hintStyle: TextStyle(color: Colors.red.shade200),
                              fillColor: Colors.red[50],
                              filled: true,
                              border: border,
                              focusedBorder: border,
                              enabledBorder: border,
                              errorBorder: border,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: ageController,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.white,
                            style: TextStyle(
                              color: Colors.black54,
                              decoration: TextDecoration.none,
                              fontFamily: 'BalooChettan2',
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.supervised_user_circle_sharp,
                                color: Colors.red.shade200,
                              ),
                              hintText: "Age",
                              hintStyle: TextStyle(color: Colors.red.shade200),
                              fillColor: Colors.red[50],
                              filled: true,
                              border: border,
                              focusedBorder: border,
                              enabledBorder: border,
                              errorBorder: border,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your age';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: sexController,
                            keyboardType: TextInputType.name,
                            cursorColor: Colors.white,
                            style: TextStyle(
                              color: Colors.black54,
                              decoration: TextDecoration.none,
                              fontFamily: 'BalooChettan2',
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.supervised_user_circle_sharp,
                                color: Colors.red.shade200,
                              ),
                              hintText: "Gender",
                              hintStyle: TextStyle(color: Colors.red.shade200),
                              fillColor: Colors.red[50],
                              filled: true,
                              border: border,
                              focusedBorder: border,
                              enabledBorder: border,
                              errorBorder: border,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter if male or female';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: addressController,
                            keyboardType: TextInputType.streetAddress,
                            cursorColor: Colors.white,
                            style: TextStyle(
                              color: Colors.black54,
                              decoration: TextDecoration.none,
                              fontFamily: 'BalooChettan2',
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.supervised_user_circle_sharp,
                                color: Colors.red.shade200,
                              ),
                              hintText: "Address",
                              hintStyle: TextStyle(color: Colors.red.shade200),
                              fillColor: Colors.red[50],
                              filled: true,
                              border: border,
                              focusedBorder: border,
                              enabledBorder: border,
                              errorBorder: border,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your address';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: FlatButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  // If the form is valid, display a Snackbar.

                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      backgroundColor: Colors.red.shade50,
                                      content: Text(
                                        'PROCESSING DATA',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFFFF6670),
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          fontFamily: 'BalooChettan2',
                                        ),
                                      )));
                                }
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(
                                  color: Color(0xFFFF6670),
                                ),
                              ),
                              height: 50,
                              minWidth: 200,
                              child: Text(
                                "UPDATE INFO",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'BalooChettan2',
                                ),
                              ),
                              color: Color(0xFFFC5D67),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: FlatButton(
                        onPressed: () {
                          updateProfile();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      (Login())));
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(
                            color: Color(0xFFFF6670),
                          ),
                        ),
                        height: 50,
                        minWidth: 200,
                        child: Text(
                          "CONTINUE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'BalooChettan2',
                          ),
                        ),
                        color: Color(0xFFFC5D67),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _pickImage(ImageSource source) async {
    final selected = await _picker.getImage(source: source);
    setState(() {
      imageFile = selected;
      img = Image.file(File(imageFile.path));
    });
  }
}
