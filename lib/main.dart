import 'package:flutter/material.dart';
import 'package:real_estate_ui/screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0,),
        fontFamily: 'Mulish',
        primarySwatch: Colors.blue,
      ),
      home: const DashboardScreen(),
    );
  }
}
