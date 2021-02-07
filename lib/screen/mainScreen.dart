import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../buildPages/credential.dart';
import '../buildPages/to-dolist.dart';
import '../buildPages/financial.dart';
import '../buildPages/people.dart';

void tryLogout() async {
  FirebaseAuth.instance.signOut();
  try {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    await _googleSignIn.signOut();
    Fluttertoast.showToast(
        msg: "Logged out Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0xFFFF6670),
        textColor: Colors.white,
        fontSize: 16.0);
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

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          tryLogout();
          Navigator.of(context).pop();
        },
        child: Icon(Icons.logout),
        backgroundColor: Color(0xFFFC5D67),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            PersonPage(),
            CredentialPage(),
            ToDoPage(),
            FinancialPage(),
            //   ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        itemCornerRadius: 10,
        backgroundColor: Colors.red.shade50,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            title:
                Text('People', style: TextStyle(fontFamily: 'BalooChettan2')),
            icon: Icon(Icons.image),
            activeColor: Color(0xFFFC5D67),
          ),
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            title: Text('Credentials',
                style: TextStyle(fontFamily: 'BalooChettan2')),
            icon: Icon(Icons.card_giftcard),
            activeColor: Color(0xFFFC5D67),
          ),
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            title: Text('To-Do List',
                style: TextStyle(fontFamily: 'BalooChettan2')),
            icon: Icon(Icons.list),
            activeColor: Color(0xFFFC5D67),
          ),
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            title: Text('Financials',
                style: TextStyle(fontFamily: 'BalooChettan2')),
            icon: Icon(Icons.attach_money),
            activeColor: Color(0xFFFC5D67),
          ),
          // BottomNavyBarItem(
          //   textAlign: TextAlign.center,
          //   title:
          //       Text('Profile', style: TextStyle(fontFamily: 'BalooChettan2')),
          //   icon: Icon(Icons.person),
          //   activeColor: Color(0xFFFC5D67),
          // ),
        ],
      ),
    );
  }
}
