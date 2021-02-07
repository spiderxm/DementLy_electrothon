import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';

class IntroPage {
  //making list of pages needed to pass in IntroViewsFlutter constructor.
  final pages = [
    PageViewModel(
      pageColor: const Color(0xFFFFffff),
      bubbleBackgroundColor: Color(0xFFFFBDC1),
      title: Text(
        'TO-DO LIST',
      ),
      body: Text(
        'You can keep the record of things you have to do in the entire day',
      ),
      mainImage: Image.asset(
        'assets/images/todo.png',
      ),
      titleTextStyle: TextStyle(
          fontFamily: 'NerkoOne', fontSize: 60, color: Color(0xFFFF4F5A)),
      bodyTextStyle: TextStyle(fontFamily: 'Satisfy', color: Color(0xFFFF4F5A)),
    ),
    PageViewModel(
      pageColor: const Color(0xFFFFffff),
      bubbleBackgroundColor: Color(0xFFFFBDC1),
      
      title: Text(
        'PEOPLE',
      ),
      body: Text(
        'You can record the pictures of your loved ones and have a view if you forget someone',
      ),
      mainImage: Image.asset(
        'assets/images/photos.png',
      ),
      titleTextStyle: TextStyle(
          fontFamily: 'NerkoOne', fontSize: 60, color: Color(0xFFFF4F5A)),
      bodyTextStyle: TextStyle(fontFamily: 'Satisfy', color: Color(0xFFFF4F5A)),
    ),
    PageViewModel(
      pageColor: const Color(0xFFFFffff),
      bubbleBackgroundColor: Color(0xFFFFBDC1),
      title: Text(
        'CREDENTIALS',
      ),
      body: Text(
        'You can keep a record of your credentials and belongings',
      ),
      mainImage: Image.asset(
        'assets/images/credentials.jpg',
      ),
      titleTextStyle: TextStyle(
          fontFamily: 'NerkoOne', fontSize: 55, color: Color(0xFFFF4F5A)),
      bodyTextStyle: TextStyle(fontFamily: 'Satisfy', color: Color(0xFFFF4F5A)),
    ),
    PageViewModel(
      bubbleBackgroundColor: Color(0xFFFFBDC1),
      pageColor: const Color(0xffffffff),
      body: Text(
        'You can keep a record of your financial accounts and passwords here',
      ),
      title: Text('FINANCIALS'),
      mainImage: Image.asset(
        'assets/images/financial.jpg',
      ),
      titleTextStyle: TextStyle(
          fontFamily: 'NerkoOne', fontSize: 60, color: Color(0xFFFF4F5A)),
      bodyTextStyle: TextStyle(fontFamily: 'Satisfy', color: Color(0xFFFF4F5A)),
    ),
  ];
}
