import 'package:flutter/material.dart';
import './new.dart';
import './people.dart';

class PeopleGrid extends StatefulWidget {
    final List<Person> people;
  PeopleGrid(this.people);
  @override
  _PeopleGridState createState() => _PeopleGridState();
}

class _PeopleGridState extends State<PeopleGrid> {
  // final listItems = [
  //   {'name': 'Maria', 'pic': 'assets/images/people1.png'},
  //   {'name': 'Robert', 'pic': 'assets/images/people2.jpg'},
  //   {'name': 'Mark', 'pic': 'assets/images/people3.jpg'},
  //   {'name': 'Angela', 'pic': 'assets/images/people4.jpg'},
  //   {'name': 'Sophie', 'pic': 'assets/images/people5.jpg'},
  // ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.people.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return People(
          personName:widget.people[index].personName,
          personPhoto: widget.people[index].personImage,
        );
      },
    );
  }
}
