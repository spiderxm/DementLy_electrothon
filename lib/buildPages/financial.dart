import 'package:flutter/material.dart';
import '../FinancialPAge.dart/financialGrid.dart';
import '../FinancialPAge.dart/Financial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:DementLy/constants.dart';

class FinancialPage extends StatefulWidget {
  @override
  _FinancialPageState createState() => _FinancialPageState();
}

final ImagePicker _picker = ImagePicker();
final bankNameController = TextEditingController();
final userNameController = TextEditingController();
final amountController = TextEditingController();
List<Finance> finance = [];
final _formKey = GlobalKey<FormState>();

class _FinancialPageState extends State<FinancialPage> {
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
          "Financials",
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
                                'Add Financial Details',
                                textAlign: TextAlign.center,
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
                                      controller: bankNameController,
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
                                        hintText: "Issuing bank",
                                        hintStyle: TextStyle(
                                            color: Colors.red.shade200),
                                        border: border,
                                        focusedBorder: border,
                                        enabledBorder: border,
                                        errorBorder: border,
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Enter Bank Name';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: userNameController,
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
                                        hintText: "Account holder name",
                                        hintStyle: TextStyle(
                                            color: Colors.red.shade200),
                                        border: border,
                                        focusedBorder: border,
                                        enabledBorder: border,
                                        errorBorder: border,
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Enter User Name';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: amountController,
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
                                        hintText: "Enter amount",
                                        hintStyle: TextStyle(
                                            color: Colors.red.shade200),
                                        border: border,
                                        focusedBorder: border,
                                        enabledBorder: border,
                                        errorBorder: border,
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Enter amount';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          setState(() {
                                            finance.add(Finance(
                                              bankName: bankNameController.text,
                                              userName: userNameController.text,
                                              amount: amountController.text,
                                              bankImage: _imageFile.path,
                                            ));
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
            child: FinancialGrid(finance),
          ),
        ),
      ),
    );
  }
}
