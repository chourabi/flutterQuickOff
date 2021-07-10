import 'package:basics/pages/BottomNavigationPage.dart';
import 'package:basics/pages/ChatApp.dart';
import 'package:basics/pages/TodosPage.dart';
import 'package:basics/pages/converterPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  BottomNavigationPage(),
    );
  }
}
