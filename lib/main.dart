import 'package:flutter/material.dart';
//import 'package:notepad/pages/addToDoPage.dart';
import 'package:notepad/pages/homePage.dart';
import 'package:notepad/pages/splash_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

    

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'splash': (BuildContext context) => SplashScreen(),
        'notes': (BuildContext context) => NotePage(),
        //'add': (BuildContext context) => AddTODO(),

      },
    );
  }
}
