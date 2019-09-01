import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:splashscreen/splashscreen.dart';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new AfterSplash(),
      title: new Text('Take a photo, get nutrients',
      ),
      image: Image.asset('images/combo.jpg',height: 0,width: 0),
      backgroundColor: Colors.teal,
    );
  }
}
class AfterSplash extends StatefulWidget {
  @override
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  File _image;

  Future getImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image=image;
    });
}
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      home: Scaffold(
        appBar: AppBar(title: Text('Nutritious information'),),
        body: Container(
            color:Colors.cyan,
            height: 250,
            width: 480,


            child: _image == null? new Text('Click on camera icon to take photo') :new Image.file(_image)


        ),

        floatingActionButton: FlatButton(onPressed: getImage,
          child: SizedBox(child: new Icon(Icons.camera)),



        ),


      ),


    );
  }
}
