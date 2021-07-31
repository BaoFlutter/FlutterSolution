
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/app/shoe_shop/model/cart_model.dart';
import 'package:online_shop/app/shoe_shop/screens/screens.dart';
import 'package:online_shop/data_source/database/database.dart';

// ignore: must_be_immutable
class CartWidget extends StatefulWidget {
  GlobalKey<AnimatedListState>? listKey;
  List<Cart>? listCart;
    final bool? isNav;
   CartWidget({Key? key, this.isNav=false,this.listKey, this.listCart}) : super(key: key);
  @override
  CartWidgetState createState() => CartWidgetState();
}

class CartWidgetState extends State<CartWidget> with SingleTickerProviderStateMixin{
  AnimationController? animationController;
  Animation<double>? animation ;
  @override
  void initState() {
  animationController =  AnimationController(vsync: this,duration: Duration(milliseconds: 200));
  animation = Tween<double>(begin: 1, end: 1.5).animate(animationController!);
  animationController!.addListener(() {
    if(animationController!.isCompleted){
      animationController!.reverse();
    }
  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cart>?>(
        future: CartDBProvider.db.getListItemInCart(),
        builder: (context ,snapshot){
      return GestureDetector(
        onTap: widget.isNav!?null: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen(listKey: widget.listKey,),));
        },
        child: AnimatedBuilder(
          animation: animationController!,
          builder: (context, child){
            return Transform.scale(
              scale:  animation!.value,
              child: child,
            );
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.shopping_cart_outlined),
          widget.listCart!=null?
          widget.listCart!.length>0?
          Positioned(
            top: AppBar().preferredSize.height/4,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: AutoSizeText("${widget.listCart!.length}", minFontSize: 1,maxLines: 1, style: TextStyle(color: Colors.white,fontSize: 10, fontWeight: FontWeight.bold),),
            ),
          ):Container():Container(),

            ],
          ),
        ),
      );
    });
  }
  animate(){
    setState(() {
      animationController!.forward();
    });

  }
}
