import 'package:flutter/material.dart';
import 'AddPage.dart';
import 'locator.dart';

//sachin kumara Liyanage
//IT17152938
void main() {
  setupLocator();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'CTSE LAB 03',
    home: new AddPage(),
  ));
}
//void main()=>runApp(new HomePage());
//void main()=>runApp(new LoginPage());
//void main()=>runApp(new ReviewsPage());

