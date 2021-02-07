import 'dart:io';
import 'package:DementLy/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../PeoplePage/widgets/peopleGrid.dart';
import 'package:image_picker/image_picker.dart';
import '../PeoplePage/widgets/new.dart';

class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() => _PersonPageState();
}

List<Person> peopleList = [];
List<File> imageList = [];
final ImagePicker _picker = ImagePicker();

class _PersonPageState extends State<PersonPage> {
  CollectionReference imgRef;
  var ref;
  PickedFile _imageFile;
  void _pickImage(ImageSource source) async {
    final selected = await _picker.getImage(source: source);
    setState(() {
      _imageFile = selected;
      imageList.add(File(_imageFile.path));
    });
  }

  String userId = FirebaseAuth.instance.currentUser.uid;

  Future uploadFile() async {
    for (var img in imageList) {
      ref = FirebaseStorage.instance
          .ref()
          .child('$userId/UserPeoplesImages/${DateTime.now()}.png');
      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          imgRef.add({'url': value});
        });
      });
    }
  }

  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imgRef = FirebaseFirestore.instance.collection('Apple');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "People",
          style: TextStyle(fontFamily: 'BalooChettan2'),
        ),
        backgroundColor: Color(0xFFFC5D67),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.add,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: ((builder) {
                    return Dialog(
                      child: SingleChildScrollView(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 30),
                            child: Column(
                              children: [
                                Text(
                                  'Add Image',
                                  style: (TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'BalooChettan2',
                                      color: Color(0xFFFC5D67))),
                                ),
                                FlatButton.icon(
                                  color: Colors.red.shade100,
                                  icon: Icon(Icons.camera_alt_sharp),
                                  onPressed: () {
                                    _pickImage(ImageSource.camera);
                                  },
                                  label: Text('Camera'),
                                ),
                                FlatButton.icon(
                                    color: Colors.red.shade100,
                                    icon: Icon(Icons.image_search),
                                    onPressed: () {
                                      _pickImage(ImageSource.gallery);
                                    },
                                    label: Text(' Gallery')),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Add Name',
                                  style: (TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'BalooChettan2',
                                      color: Color(0xFFFC5D67))),
                                ),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: nameController,
                                        keyboardType: TextInputType.name,
                                        textAlign: TextAlign.center,
                                        cursorColor: Colors.black,
                                        style: TextStyle(
                                          color: Colors.black54,
                                          decoration: TextDecoration.none,
                                          fontFamily: 'BalooChettan2',
                                        ),
                                        decoration: InputDecoration(
                                          fillColor: Colors.red[50],
                                          filled: true,
                                          border: border,
                                          focusedBorder: border,
                                          enabledBorder: border,
                                          errorBorder: border,
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Enter name';
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {
                                            setState(() {
                                              peopleList.add(Person(
                                                personName: nameController.text,
                                                personImage: _imageFile.path,
                                              ));
                                            });

                                            Scaffold.of(context).showSnackBar(
                                                SnackBar(
                                                    backgroundColor:
                                                        Colors.red.shade50,
                                                    content: Text(
                                                      'PROCESSING DATA',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFFF6670),
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                        fontFamily:
                                                            'BalooChettan2',
                                                      ),
                                                    )));
                                            Navigator.pop(context);
                                          }
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: BorderSide(
                                            color: Color(0xFFFF6670),
                                          ),
                                        ),
                                        height: 50,
                                        minWidth: 200,
                                        child: Text(
                                          "UPDATE",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily: 'BalooChettan2',
                                          ),
                                        ),
                                        color: Color(0xFFFC5D67),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                );
              })
        ],
      ),
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.red.shade100,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.only(
                top: 16,
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10),
            child: PeopleGrid(peopleList),
          ),
        ),
      ),
    );
  }
}
