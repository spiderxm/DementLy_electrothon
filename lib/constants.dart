import 'package:flutter/material.dart';

OutlineInputBorder border = OutlineInputBorder(
  borderSide: new BorderSide(color: Colors.red[50]),
  borderRadius: BorderRadius.circular(20),
);

String nameOfApp = "Remember it!!";

class DetailsField extends StatelessWidget {
  DetailsField(
      {this.detailName, this.detailIcon, this.keyboardType, this.help,this.control});
  final String detailName;
  final IconData detailIcon;
  final String help;
  final TextInputType keyboardType;
  final TextEditingController control;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: control,
      keyboardType: keyboardType,
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.black54,
        decoration: TextDecoration.none,
        fontFamily: 'BalooChettan2',
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          detailIcon,
          color: Colors.red.shade200,
        ),
        hintText: help,
        hintStyle: TextStyle(color: Colors.red.shade200),
        fillColor: Colors.red[50],
        filled: true,
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        errorBorder: border,
      ),
    );
  }
}
