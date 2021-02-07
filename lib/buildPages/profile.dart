// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../screen/userDetails.dart';
// import 'dart:io';

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// String name;

// String age;

// String gender;

// String address;

// File url;


// class _ProfilePageState extends State<ProfilePage> {
//   // void getData() async {
//   //   DocumentSnapshot variable = await FirebaseFirestore.instance
//   //       .collection('UserProfile')
//   //       .doc(FirebaseAuth.instance.currentUser.uid)
//   //       .get();
//   //   var data = variable.data();
//   //   name = data['name'];
//   //   age = data['age'];
//   //   gender = data['gender'];
//   //   address = data['address'];
//   //   url = data['image_url'];
//   // }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//    // getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Details(url,name,age,gender,address);
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "Profile",
//           style: TextStyle(fontFamily: 'BalooChettan2'),
//         ),
//         backgroundColor: Color(0xFFFC5D67),
//       ),
//       resizeToAvoidBottomPadding: false,
//       backgroundColor: Colors.red.shade100,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             child: Padding(
//               padding: const EdgeInsets.all(32.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Center(
//                     child: CircleAvatar(
//                       radius: 80,
//                       backgroundColor: Colors.red[50],
//                       backgroundImage: imageFile == null
//                                 ? AssetImage('assets/images/default-dp.png')
//                                 : FileImage(url),
//                       // backgroundImage:
//                       //     ExactAssetImage('assets/images/ghajini1.jpg'),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   SizedBox(
//                     height: 30,
//                     child: Divider(color: Colors.black),
//                   ),
//                   Container(
//                     height: 60,
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.red.shade50),
//                     child: Center(
//                         child: Text("Name : $name",
//                             style: TextStyle(
//                                 fontFamily: 'Satisfy',
//                                 fontSize: 25,
//                                 color: Color(0xFFFC5D67)))),
//                   ),
//                   SizedBox(
//                     height: 30,
//                     child: Divider(color: Colors.black),
//                   ),
//                   Container(
//                     height: 60,
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.red.shade50),
//                     child: Center(
//                         child: Text("Age : $age",
//                             style: TextStyle(
//                                 fontFamily: 'Satisfy',
//                                 fontSize: 25,
//                                 color: Color(0xFFFC5D67)))),
//                   ),
//                   SizedBox(
//                     height: 30,
//                     child: Divider(color: Colors.black),
//                   ),
//                   Container(
//                     height: 60,
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.red.shade50),
//                     child: Center(
//                         child: Text("Gender : $gender",
//                             style: TextStyle(
//                                 fontFamily: 'Satisfy',
//                                 fontSize: 25,
//                                 color: Color(0xFFFC5D67)))),
//                   ),
//                   SizedBox(
//                     height: 30,
//                     child: Divider(color: Colors.black),
//                   ),
//                   Container(
//                       height: 60,
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.red.shade50),
//                       child: Center(
//                           child: Text("Address : $address",
//                               style: TextStyle(
//                                   fontFamily: 'Satisfy',
//                                   fontSize: 25,
//                                   color: Color(0xFFFC5D67))))),
//                   SizedBox(
//                     height: 30,
//                     child: Divider(color: Colors.black),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
