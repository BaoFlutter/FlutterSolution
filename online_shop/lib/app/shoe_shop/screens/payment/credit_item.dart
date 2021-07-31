import 'dart:math';

import 'package:flutter/material.dart';
import 'package:online_shop/app/shoe_shop/screens/widget/src/card_behind_item.dart';
import 'package:online_shop/app/shoe_shop/screens/widget/src/card_front_item.dart';

class CreditItem extends StatefulWidget {
final String? cvc;
final String? number;
final String? title;
final String? date;
final String? name;

  const CreditItem({Key? key, this.cvc, this.number, this.title, this.date, this.name, }) : super(key: key);
  @override
  _CreditItemState createState() => _CreditItemState();
}

class _CreditItemState extends State<CreditItem> with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation ;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 300));
    _animation = Tween<double>(begin: 0,end: 1).animate(_animationController!);
    _animationController!.addListener(() {
        setState(() {

        });

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _animationController!,
        builder: (context, child){
      return Transform(
        transform: Matrix4.identity()..setEntry(3, 2, 0.002)..rotateY(pi *_animation!.value),
        child: child,
        alignment: Alignment.center,
      );
        },
    child: GestureDetector(
      onTap: (){
        if(_animationController!.isCompleted){
          _animationController!.reverse();
        }else{
          _animationController!.forward();
        }

      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:_animation!.value<0.5?
        CardFrontItem(title: widget.title!,
          name: widget.name!,number: widget.number!,date: widget.date!,)
            :CardBehindItem(cvc: widget.cvc!,),
      ),
    )
    );
  }
}
