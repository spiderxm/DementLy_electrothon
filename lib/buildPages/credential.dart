import 'package:flutter/material.dart';
import 'package:DementLy/constants.dart';
import 'package:image_picker/image_picker.dart';
import '../CredentialPage/credentialGrid.dart';
import '../CredentialPage/Credential.dart';

class CredentialPage extends StatefulWidget {
  @override
  _CredentialPageState createState() => _CredentialPageState();
}

final ImagePicker _picker = ImagePicker();
List<Credential> credit = [];
final titleController = TextEditingController();
final descController = TextEditingController();

final _formKey = GlobalKey<FormState>();

class _CredentialPageState extends State<CredentialPage> {
  PickedFile _imageFile;
  void _pickImage(ImageSource source) async {
    final selected = await _picker.getImage(source: source);
    setState(() {
      _imageFile = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Credentials",
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
                                'Add Credential',
                                style: (TextStyle(
                                    fontSize: 25,
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
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: titleController,
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
                                        hintText: "Title of credential",
                                        hintStyle: TextStyle(
                                            color: Colors.red.shade200),
                                        border: border,
                                        focusedBorder: border,
                                        enabledBorder: border,
                                        errorBorder: border,
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Enter Title';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      maxLines: 3,
                                      controller: descController,
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
                                        hintText: "Description of credential",
                                        hintStyle: TextStyle(
                                            color: Colors.red.shade200),
                                        border: border,
                                        focusedBorder: border,
                                        enabledBorder: border,
                                        errorBorder: border,
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Enter Description';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          setState(() {
                                            credit.add(Credential(
                                                title: titleController.text,
                                                desc: descController.text,
                                                creditImage: _imageFile.path));
                                          });

                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  backgroundColor:
                                                      Colors.red.shade50,
                                                  content: Text(
                                                    'PROCESSING DATA',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color(0xFFFF6670),
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
            },
          )
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
            child: CredentialGrid(credit),
          ),
        ),
      ),
    );
  }
}
