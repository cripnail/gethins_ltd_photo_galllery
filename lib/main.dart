import 'package:flutter/material.dart';
import 'package:photo_galllery/screens/header_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final Color headerPageDarkColor = Colors.deepPurple;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: ThemeData.dark().primaryColor,
          foregroundColor: Colors.white, // Set the AppBar text color
        ),
      ),
      home: HeaderPage(),
    );
  }
}
