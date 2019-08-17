import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() => runApp(new MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      title: 'Image picker',
      home: Scaffold(
        appBar: AppBar(title: Text('Nutritious information'),),
        body: new Center(child: _image == null? new Text('Click on camera icon to take photo'):new Image.file(_image)),

        floatingActionButton: FlatButton(onPressed: getImage,
       child: Center(child: new Icon(Icons.camera),)
          ,
        ),
      ),
      

    );
  }
}
