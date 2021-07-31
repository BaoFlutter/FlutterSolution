import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:online_shop/app/shoe_shop/model/cart_model.dart';
import 'package:online_shop/data_source/assets_link/assets_links.dart';

class ItemCart extends StatefulWidget {
  final int? index;
  final Cart? cart;
  final Function(int)? onChange;
  final Function(int)? onDelete;
  const ItemCart({Key? key, this.cart,this.onChange, this.onDelete, this.index}) : super(key: key);
  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> with TickerProviderStateMixin {
  bool start = false;
  AnimationController? _animationController;
  AnimationController? _animationControllerName;
  AnimationController? _animationControllerType;
  AnimationController? _animationControllerPrice;
  AnimationController? _animationControllerCal;
  Animation<double>? _animationScale;
  Animation<Offset>? _animationTransformName;
  Animation<Offset>? _animationTransformType;
  Animation<Offset>? _animationTransformPrice;
  Animation<Offset>? _animationTransformCal;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 800+widget.index!*10),);
    _animationControllerName = AnimationController(vsync: this, duration: Duration(milliseconds: 800 +widget.index!*10),);
    _animationControllerType = AnimationController(vsync: this, duration: Duration(milliseconds: 1000 +widget.index!*10),);
    _animationControllerPrice = AnimationController(vsync: this, duration: Duration(milliseconds: 1200+widget.index!*10),);
    _animationControllerCal = AnimationController(vsync: this, duration: Duration(milliseconds: 1400+widget.index!*10),);
    _animationScale = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _animationController! , curve: Curves.elasticOut, reverseCurve: Curves.elasticOut));
    _animationTransformName = Tween<Offset>(begin: Offset(200,0),end: Offset.zero).animate(CurvedAnimation(parent: _animationControllerName!, curve: Curves.fastOutSlowIn));
    _animationTransformType = Tween<Offset>(begin: Offset(200,0),end: Offset.zero).animate(CurvedAnimation(parent: _animationControllerType!, curve: Curves.fastOutSlowIn));
    _animationTransformPrice = Tween<Offset>(begin: Offset(200,0),end: Offset.zero).animate(CurvedAnimation(parent: _animationControllerPrice!, curve: Curves.fastOutSlowIn));
    _animationTransformCal = Tween<Offset>(begin: Offset(200,0),end: Offset.zero).animate(CurvedAnimation(parent: _animationControllerCal!, curve: Curves.fastOutSlowIn));
    _animationController!.forward();
    _animationControllerName!.forward();
    _animationControllerType!.forward();
    _animationControllerPrice!.forward();
    _animationControllerCal!.forward();
    setState(() {
      start = true;
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    _animationControllerName!.dispose();
    _animationControllerType!.dispose();
    _animationControllerPrice!.dispose();
    _animationControllerCal!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _imageItem(context),
          _bodyItem(context),
        ],
      ),
    );
  }

  _imageItem(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child){
        return Transform.scale(
          scale: _animationScale!.value,
          child: child,
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width/4,
        height: MediaQuery.of(context).size.width/4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: Offset(2,2),
              blurRadius: 4
            )
          ],
          image: DecorationImage(
            fit: BoxFit.cover,
              image: CachedNetworkImageProvider(widget.cart!.urlPhoto!))
        ),
      ),
    );
  }

  _bodyItem(BuildContext context) {
    return Expanded(
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 800+widget.index!*10),
        opacity: start? 1.0:0,
        child: Container(
          height: MediaQuery.of(context).size.width/4,
          padding: EdgeInsets.only(left: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedBuilder(
                animation: _animationControllerName!,
                builder: (context,child){
                  return Transform.translate(
                      offset: _animationTransformName!.value,
                    child: child,
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      child: AutoSizeText(widget.cart!.name!,
                        maxLines: 2,
                        style: TextStyle(color: Color(0xff021041),fontSize: 16,fontWeight: FontWeight.bold),),
                    ),
                    InkWell(
                        onTap: (){
                          _animationController!.reverse();
                          _animationControllerName!.reverse();
                          _animationControllerType!.reverse();
                          _animationControllerPrice!.reverse();
                          _animationControllerCal!.reverse();
                          setState(() {
                            start = false;
                          });
                          Future.delayed(Duration(milliseconds: 1000+widget.index!*10),(){
                            widget.onDelete!(widget.cart!.id!);
                          });

                        },
                        child: Image.asset(IconsLinks().clear,width: 24,height: 24,))
                  ],
                ),
              ),
              SizedBox(height: 5,),
              AnimatedBuilder(
                animation: _animationControllerType!,
                builder: (context,child){
                  return Transform.translate(
                    offset: _animationTransformType!.value,
                    child: child,
                  );
                },
                child: Text(widget.cart!.type!,  style: TextStyle(
                    color: Color(0xff000000).withOpacity(0.5),
                    fontSize: 11,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Spacer(),
              Row(
                children: [
                  AnimatedBuilder(
                    animation: _animationControllerPrice!,
                    builder: (context,child){
                      return Transform.translate(
                        offset: _animationTransformPrice!.value,
                        child: child,
                      );
                    },
                    child: AutoSizeText("\$${_price()}",
                      maxLines: 1,
                      minFontSize: 1,
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.red),),
                  ),
                  Spacer(),
                  AnimatedBuilder(
                    animation: _animationControllerCal!,
                    builder: (context,child){
                      return Transform.translate(
                        offset: _animationTransformCal!.value,
                        child: child,
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width/4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _itemCalculation(context:context,
                            color: Color(0xffA3A3A3),
                            item: IconsLinks().minus,
                            onTap: (){
                              setState(() {
                                if(widget.cart!.amount!>1){
                                  widget.cart!.amount = widget.cart!.amount! - 1;
                                  widget.onChange!(widget.cart!.amount!);
                                }
                                 });
                            }),
                          AnimatedSwitcher(
                                duration: Duration(milliseconds: 300),
                            transitionBuilder: (child, animation){
                                  return ScaleTransition(
                                    scale: animation,
                                    child: child,
                                  );
                            },
                              child:  Text("${widget.cart!.amount}",key: ValueKey(widget.cart!.amount), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                          _itemCalculation(context:context,
                              color: Color(0xff767676),
                              item: IconsLinks().plus,
                              onTap: (){
                                setState(() {
                                  widget.cart!.amount = widget.cart!.amount! + 1 ;
                                    widget.onChange!(widget.cart!.amount!);
                                });
                              }),
                        ],
                      ),
                    ),
                  )
                ],)
            ],
          ),
        ),
      ),
    );
  }

  String _price(){
    int price = widget.cart!.price! * widget.cart!.amount!;
    var f = NumberFormat("###,###", 'en_US');
    return f.format(price);
  }

  _itemCalculation({BuildContext? context, Color? color, String? item,  onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 26,
        width: 26,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4)
        ),
        child: Image.asset(item!, width: 24,height: 24,),
      ),
    );
  }
}
