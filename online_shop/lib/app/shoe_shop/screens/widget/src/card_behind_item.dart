import 'dart:math';

import 'package:flutter/material.dart';

class CardBehindItem extends StatelessWidget {
  final String? cvc;

  const CardBehindItem({Key? key, this.cvc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.identity()..setEntry(3, 2, 0.002)..rotateY(pi),
      alignment: Alignment.center,
      child: Container(
        height: MediaQuery.of(context).size.height/5.5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
           color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 4,color: Color(0xffF1F1F1)),
            boxShadow: [
              BoxShadow(
                  color: Color(0xff000000).withOpacity(0.25),
                  offset: Offset(2,2),
                  blurRadius: 4
              )
            ]
        ),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              height:  (MediaQuery.of(context).size.height/5.5)/3.5,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  height:  (MediaQuery.of(context).size.height/5.5)/5,
                  width: MediaQuery.of(context).size.width/2.5,
                  color: Colors.grey,
                ),
                SizedBox(width: 7,),
                Text(cvc!,style: TextStyle(fontFamily: "Sanchez", fontSize: 15),)
              ],
            ),
            SizedBox(height: 10,),
            Container(
              height:  (MediaQuery.of(context).size.height/5.5)/10,
              width: MediaQuery.of(context).size.width/2.5,
              color: Colors.grey,
            ),
            SizedBox(height: 5,),
            Container(
              height:  (MediaQuery.of(context).size.height/5.5)/10,
              width: MediaQuery.of(context).size.width/2.5,
              color: Colors.grey,
            ),
          ],
        )
      ),
    );
  }
}
