import 'package:flutter/material.dart';

import 'Screens/home2.dart';
import 'Screens/home_page_screen.dart';
import 'Screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Attendance App',
      initialRoute: '/login',
      routes: {
        '/login' : (context) => LoginScreen(),
        '/home': (context) => HomePageScreen(),
        // '/home2': (context) => HomePage2Screen(),
      },
    );
  }
}
