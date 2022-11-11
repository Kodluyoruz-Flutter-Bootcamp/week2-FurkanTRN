import 'package:flutter/material.dart';
import 'package:library_system/Models/Employer.dart';
import 'package:library_system/Models/Person.dart';
import 'package:library_system/Screens/EmployeeScreens/EmployeeOperations_Page.dart';
import 'package:library_system/Screens/MemberScreens/MemberOperations_Page.dart';

import 'Screens/BooksScreens/BookRecordPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MemberOperations_Page();
    //return EmployeeOperations_Page();
  }
}
