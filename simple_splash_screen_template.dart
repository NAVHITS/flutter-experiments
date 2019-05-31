import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //Here change the class of the home page.
    Timer(Duration(seconds: 2), () => Navigator.push(context,MaterialPageRoute(builder: (context) => MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                       Image.asset(
                          'assets/icon.png',
                         width: 150.0,
                         height: 150.0,
                        ),
                       Padding(
                         padding: EdgeInsets.only(top: 10.0),
                       ),
                      Text("Security Wala", style: TextStyle(color: Colors.black, fontSize: 24.0)),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
