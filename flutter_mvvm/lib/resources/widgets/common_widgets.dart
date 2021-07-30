import 'package:flutter/material.dart';


Widget customButton({ @required String? buttonName, @required onPressed}){
  return GestureDetector(
    child: Container(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.blue,
        ),
        child: Center(
          child: Text(buttonName!, style: TextStyle(color: Colors.white),),
        )
    ),
    onTap: onPressed,
  );

}