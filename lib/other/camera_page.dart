import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    print(image);

    setState(() {
      _image = image;
    });
    if (_image != null) {
      SentIMG();
    }
  }

  Future SentIMG() async {
    print("Call http");
    Dio dio = Dio();
    FormData formData = new FormData.from({
      //"name": "wendux",
      //"age": 25,
      "file": UploadFileInfo(_image, "img.jpg")
    });
    // var  response2 = await dio.get("http://192.168.137.1:5000/api/Simple");
    //final response = await http.get('http://192.168.137.1:5000/api/simple');
    var response = await dio.post(
        "http://192.168.137.1:5000/api/Simple/UploadFile",
        data: formData);
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Camera App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("AppBar"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => getImage(),
          child: Icon(Icons.camera_alt),
        ),
        body: Center(
          child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
                image: _image != null
                    ? DecorationImage(
                        image: FileImage(_image), fit: BoxFit.fill)
                    : null),
          ),
        ),
      ),
    );
  }
}
