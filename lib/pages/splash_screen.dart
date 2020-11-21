import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:notepad/pages/login_page.dart';
//import 'package:notepad/pages/edit_profile_page.dart';
//import 'package:notepad/pages/notePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10,)
    ).then((value) =>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()))
);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _appBackground(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("MyNotes",
                  style: TextStyle(
                    fontSize: 50.0,
                    letterSpacing: 1.0,
                    color: Colors.white70,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SpinKitWave(
                color: Colors.blue,
                duration: Duration(seconds: 5),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: Image(
                      image: AssetImage('assets/sofka_logo.png'),
                      width: 120.0,
                      fit: BoxFit.fitWidth)),
              Image(
                image: AssetImage('assets/liga_logo.png'),
                width: 140.0,
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Image(
                    image: AssetImage('assets/jovenes_logo.png'),
                    width: 90.0,
                    fit: BoxFit.fitWidth),
              ),
            ],
          ),
        )
      ],
    ));
  }

  Widget _appBackground() {
    final gradient = Container(
      width: double.infinity,
      height: double.infinity,
         decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff34415b),
              //Color(0xff2d374c),
                Color(0xff3a456b)
            ])),
    );

    return Stack(
      children: <Widget>[
        gradient,
        Container(
          width: double.infinity,
          height: 90.0,
          color: Colors.white70,
          margin: EdgeInsets.only(top: 512),
        )
      ],
    );
  }
}
