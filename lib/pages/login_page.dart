import 'package:flutter/material.dart';
import 'package:notepad/pages/homePage.dart';
import 'package:notepad/widgets/topDecoration.dart';
import 'package:notepad/widgets/login_fields.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff5773a8),Color(0xff405173), Color(0xff2c374d)
            ])),
        child: Stack(
          children: [
            topDecoration(),
            ListView(
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(top: 110.0),
                        child: Image(
                          image: AssetImage('assets/notes_icon.png'),
                            fit: BoxFit.contain,
                          ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(color: Colors.black26, blurRadius: 25.0)
                            ]),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Welcome back!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0, fontWeight: FontWeight.w400),
                      ),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints(maxHeight: 105.0, maxWidth: 300.0),
                        child: Form(
                            child: Column(
                          children: [
                            InputText(
                                label: 'User Name',
                                isSecure: false,
                                fontSize: 18.0,
                                textEditingController: _userController
                                ),
                            InputText(
                              label: 'Password',
                              isSecure: true,
                              fontSize: 18.0,
                              textEditingController: _passWordController,
                            )
                          ],
                        )),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: RaisedButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              onPressed: () {
                                goToNotePage(context);
                              },
                              child: Text('Log In')))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void goToNotePage(BuildContext context) {
    var usuario = _userController.text;
    var contrasena = _passWordController.text;

    if (usuario == 'ManuCG' && contrasena == '123456') {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => NotePage()));
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Datos incorrectos',
              style: TextStyle(color: Colors.red),
            ),
          );
        },
      );
    }
  }
    Widget topDecoration() {
    return Stack(children: [
      Rectangle(
        rectangleHeight: 150.0,
        rectangleColor: Colors.blue,
      ),
      // 
      
    ]);
  }
}
