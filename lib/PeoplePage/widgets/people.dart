import 'package:flutter/material.dart';

class People extends StatefulWidget {
  final personName;
  final personPhoto;
  People({this.personName, this.personPhoto});

  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: widget.personName,
        child: Material(
          child: InkWell(
              onTap: () {},
              child: GridTile(
                footer: Container(
                  height: 40,
                  color: Colors.black45,
                  child: ListTile(
                    title: Text(
                      widget.personName,
                      style: TextStyle(
                        fontFamily: 'BalooCHettan2',
                        color: Colors.red.shade50,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                child: Image.asset(
                  widget.personPhoto,
                  fit: BoxFit.cover,
                ),
              )),
        ),
      ),
    );
  }
}
