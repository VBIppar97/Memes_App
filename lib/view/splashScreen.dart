import 'package:flutter/material.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children:[
          Image.network(
              width : MediaQuery.of(context).size.width,
              height : 300,
              "https://raw.githubusercontent.com/codewithdhruv22/CodeWithDhruv/main/applogo.png"),
        SizedBox(height:20 ,),
          Text("UnSad", style: TextStyle(fontSize: 35, fontWeight:FontWeight.bold ),)
        ],
      )),
    );
  }
}
