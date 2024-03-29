import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

//var _signatureCanvas = Signature(
//  width: 300,
//  height: 300,
//  backgroundColor: Colors.lightBlueAccent,
//);

class SignaturePage extends StatefulWidget {
  @override
  _SignaturePageState createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  var _signatureCanvas = Signature(
    height: 300,
    backgroundColor: Colors.white,
//    onChanged: (points) {
//      print(points);
//    },
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //SIGNATURE CANVAS
                  _signatureCanvas,
                  //OK AND CLEAR BUTTONS
                  Container(
                      decoration: const BoxDecoration(
                        color: Colors.pink,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          //SHOW EXPORTED IMAGE IN NEW ROUTE
                          IconButton(
                            icon: const Icon(Icons.check),
                            color: Colors.blue,
                            onPressed: () async {
                              if (_signatureCanvas.isNotEmpty) {
                                var data = await _signatureCanvas.exportBytes();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return Scaffold(
                                        appBar: AppBar(),
                                        body: Container(
                                          color: Colors.grey[300],
                                          child: Image.memory(data),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                          //CLEAR CANVAS
                          IconButton(
                            icon: const Icon(Icons.clear),
                            color: Colors.blue,
                            onPressed: () {
                              setState(() {
                                return _signatureCanvas.clear();
                              });
                            },
                          ),
                        ],
                      )),
                ],
              ),
            ),
      ),
    );
  }
}
