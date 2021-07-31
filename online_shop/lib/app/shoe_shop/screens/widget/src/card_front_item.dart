import 'package:flutter/material.dart';
import 'package:online_shop/data_source/assets_link/assets_links.dart';

class CardFrontItem extends StatelessWidget {
  final String? title;
  final String? name;
  final String? number;
  final String? date;

  const CardFrontItem({Key? key, this.title, this.name, this.number, this.date}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/5.5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageLinks().creditCardBackground),
          fit: BoxFit.cover,
        ),
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
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: 20,
              child: Text(title!,style: TextStyle(fontFamily: "SSOne", fontSize: 18),)),
          Positioned(
              bottom: 8,
              left: 15,
              child: Text(name!,style: TextStyle(fontFamily: "Sanchez", fontSize: 16),)),
          Positioned(
              bottom: 40,
              right: 20,
              child: Text(date!,style: TextStyle(fontFamily: "Sanchez", fontSize: 10),)),
          Positioned(
              bottom: 40,
              right: 55,
              child: Text("VALID\nTHRU",style: TextStyle(fontFamily: "Sanchez", fontSize: 6),)),
          Positioned(
              bottom: 70,
              left: 15,
              child: Text(number!,style: TextStyle(fontFamily: "Sanchez", fontSize: 16,fontStyle: FontStyle.italic),)),
        title=="MASTERCARD"?  Positioned(
              top: 30,
              right: 20,
              child: Image.asset(IconsLinks().masterCard),width: 30,height: 30,):Container(),

        ],
      ),
    );
  }
}
