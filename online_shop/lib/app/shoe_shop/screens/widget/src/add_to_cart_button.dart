import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/generated/l10n.dart';

import 'cart_widget.dart';

class AddToCartButton extends StatefulWidget {
  final GlobalKey<CartWidgetState>? cartKey;
  final Function? onAddToCart;

  const AddToCartButton({Key? key, this.cartKey, this.onAddToCart}) : super(key: key);
  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> with TickerProviderStateMixin {
 AnimationController? _animationController ;
 AnimationController? _animationController2 ;
 Animation<double>? _animation;
 Animation<Offset>? _animation2 ;
 bool isResize = false;
 @override
  void initState() {
  _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  _animationController2 = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  _animation = Tween<double>(begin: 1, end: 0.2).animate(_animationController!);
  _animation2 = MaterialPointArcTween(begin: Offset.zero,end:Offset.zero).animate(_animationController2!);
   _animationController!.addListener(() {
    if(_animationController!.isCompleted){
      _animationController2!.forward();
    }
  });
   _animationController2!.addListener(() {
     if(_animationController2!.isCompleted){
       widget.cartKey!.currentState!.animate();
       _animationController2!.reset();
       _animationController!.reset();
       setState(() {
         isResize = !isResize;
       });
     }
   });
    super.initState();
  }
  
  GlobalKey buttonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return   AnimatedBuilder(
      animation: _animationController!,
      builder: (context,child){
        return Transform.scale(
            scale: _animation!.value,
            child: child,
        );
    },
      child: AnimatedBuilder(
        animation: _animationController2!,
        builder: (context, child){
          return Transform.translate(
              offset: _animation2!.value,
          child: child,
          );
        },
        child: FlatButton(
          key: buttonKey,
          padding: EdgeInsets.all(0),
            color: Colors.black,
            splashColor: Colors.white,
            onPressed: (){
           _onAnimate();
           widget.onAddToCart!();
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
                padding: EdgeInsets.all(16),
                width: isResize?50 : MediaQuery.of(context).size.width,
                height: 50 ,
                child: Center(child: AutoSizeText(S.current!.add_to_cart, minFontSize: 1, maxLines: 1,style: TextStyle(color: Colors.white,fontSize: 18),)))),
      ),
    );

  }
  _onAnimate(){
    RenderBox? buttonBox = buttonKey.currentContext!.findRenderObject() as RenderBox?;
    Offset? positionButton = buttonBox!.localToGlobal(Offset.zero);
    RenderBox? cartBox = widget.cartKey!.currentContext!.findRenderObject() as RenderBox?;
    Offset? positionCart = cartBox!.localToGlobal(Offset.zero);
    _animation2 = MaterialPointArcTween(begin: Offset.zero,end: Offset(
        (positionCart.dx-MediaQuery.of(context).size.width/2+12)*5.0,
        -(positionButton.dy-positionCart.dy)*5.0)).animate(_animationController2!);
    _animationController!.forward();
    setState(() {
      isResize = !isResize;
    });
  }
}
