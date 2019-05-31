import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:date_format/date_format.dart';

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
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  File image;

  picker() async {
    print('Picker is called');
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
//    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = img;
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    final firstName = TextField(
      obscureText: false,
      textCapitalization: TextCapitalization.words,

      style: style,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person_pin),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "First Name",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      keyboardType: TextInputType.text,
    );
    final secondName = TextField(
      obscureText: false,
      textCapitalization: TextCapitalization.words,
      style: style,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person_pin),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Second Name",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      keyboardType: TextInputType.text,
    );
    final contact = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Contact Number",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      keyboardType: TextInputType.phone,
    );
    final vehicleNumber = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.directions_car),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Vehicle Number",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final visitDetails = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.people),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Whom to meet?",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final formattedStr = formatDate(
        DateTime.now(), [dd, '.', mm, '.', yy, ' ', HH, ':', nn, ':', ss]);

    final face = FloatingActionButton(
      onPressed: picker,
      child: new Icon(Icons.camera_alt)
    );
      final loginButton = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: MediaQuery
              .of(context)
              .size
              .width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {},
          child: Text("Submit",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      );
      return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Image.asset(
                  'assets/icon.png',
                  fit: BoxFit.contain,
                  height: 32,
                ),
                Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Registration'))
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(36.0),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 45.0),
                      firstName,
                      SizedBox(height: 25.0),
                      secondName,
                      SizedBox(height: 25.0),
                      contact,
                      SizedBox(height: 25.0),
                      vehicleNumber,
                      SizedBox(height: 25.0),
                      visitDetails,
                      SizedBox(height: 25.0),
                      //Text(formattedStr),
                      SizedBox(height: 25.0),
                      face,
                      SizedBox(height: 35.0),
                  Center(
                    child: image == null
                        ? new Text('No Image to Show ')
                        : new Image.file(image, height: 150, width: 150),

                  ),
                      SizedBox(
                        height: 35.0,
                      ),
                      SizedBox(height: 25.0),
                      loginButton,
                    ],
                  ),
                ),
              ),
            ),
          )
      );
    }
}
