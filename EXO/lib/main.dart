import 'package:flutter/material.dart';
import 'HomePage.dart';
void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XoX-GaMe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primaryColor: Color(0xff2c2c54),
      backgroundColor: Color(0xff2C3A47),      
      ),
      home: Homepage(),
    );
  }
}
