import 'package:first_app/view/mainScreen.dart';
import 'package:first_app/view/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
//Widget - Class
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool showSplash=true;
  showSplashScreen(){
    Future.delayed(Duration(seconds: 5),(){
      setState(() {
        showSplash = false;
      });
    });
  }

  @override
  void initState() {
    showSplashScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UnSad',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: showSplash? splashScreen(): MainScreen(),
    );
  }
}
