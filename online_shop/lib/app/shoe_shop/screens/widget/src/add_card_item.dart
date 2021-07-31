import 'package:flutter/material.dart';

class AddCardItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height/5.5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 4,color: Color(0xffF1F1F1)),
            color: Colors.black.withOpacity(0.8),
            boxShadow: [
              BoxShadow(
                  color: Color(0xff000000).withOpacity(0.25),
                  offset: Offset(2,2),
                  blurRadius: 4
              )
            ]
        ),
        child: Center(
          child: Text("+ Add card", style: TextStyle(fontSize: 20, color: Colors.white),),
        ),
      ),
    );
  }
}