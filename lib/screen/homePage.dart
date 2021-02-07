import 'package:flutter/material.dart';
import 'introPage.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import './userDetails.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white, //Color(0xFFFFBCA8),
      // appBar: AppBar(
      //   title: Text(nameOfApp),
      //   backgroundColor: Color(0xFF7C1A08),
      // ),
      body: SafeArea(
        child: Container(
          height: double.maxFinite,
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "DEMENTLY",
                      style: TextStyle(
                        fontFamily: 'NerkoOne',
                        fontSize: 65,
                        color: Color(0xFFFF4F5A),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "This app is built to support and help people suffering from dementia. We help you by keeping your information safe and sound. You can keep a record of your loved ones, credentials and financial stuff by clicking their images and storing there name or id, also we give you a handy to-list to handle your daily works and tasks. Tap the next button to view all details regarding the app.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'Satisfy',
                        fontSize: 13,
                        letterSpacing: 1,
                        color: Color(0xFFFF4F5A),
                      ),
                    ),
                    Image(
                      image: AssetImage("assets/images/homepage.png"),
                      height: 280,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  IntroViewsFlutter(
                                IntroPage().pages,
                                showSkipButton: true,
                                fullTransition: 200,
                                pageButtonTextStyles: TextStyle(
                                  color: Color(0xFFD81B28),
                                  fontSize: 15.0,
                                  fontFamily: 'BalooChettan2',
                                ),
                                onTapDoneButton: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              UserDetails()));
                                },
                              ),
                            ));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: 50,
                      minWidth: 200,
                      child: Text(
                        "NEXT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'BalooChettan2',
                        ),
                      ),
                      color: Color(0xFFFF4F5A),
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
}
