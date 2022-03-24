import 'package:flutter/material.dart';
import 'package:git_dashboard/View/Dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GIT DASHBOARD',
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}
