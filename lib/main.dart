//  https://dribbble.com/shots/7077723-Home-Search-Mobile-App
//  https://dribbble.com/shots/6752188-Reminder

import 'package:first_project/main_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'landing_page.dart';
import 'main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    LandingPage.tag: (context) => LandingPage(),
    MainPage.tag: (context) => MainPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: LandingPage(),
      routes: routes,
    );
  }
}
