import 'package:flutter/material.dart';

MaterialButton buildApplicationButton(String text, {onPressed: Function}) {
  return MaterialButton(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(fontSize: 18.0)),
      color: Colors.amber,
      height: 50.0);
}

RaisedButton buildRaisedButton(String text,
    {onPressed: Function, buttoncolor: Colors}) {
  return RaisedButton(
    onPressed: onPressed,
    color: buttoncolor,
    child: Text(text,
        style: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
  );
}
