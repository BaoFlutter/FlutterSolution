import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/app/shoe_shop/model/cart_model.dart';
import 'package:online_shop/app/shoe_shop/model/response_product_model.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


import 'details_product.dart';

// ignore: must_be_immutable
class ItemProduct extends StatefulWidget {
  GlobalKey<AnimatedListState>? listKey;
  List<Cart>? listCart;
  final Product? product ;

   ItemProduct({Key? key, @required this.product, this.listKey, this.listCart})
      : super(key: key);

  @override
  _ItemProductState createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0,4),
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4
            )
          ]
      ),
      child: Hero(
        tag: widget.product!.urlPhoto!,
        child: FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          padding: EdgeInsets.all(0),
          onPressed: (){
            pushNewScreen(context,
                screen: DetailsShoe(product: widget.product, listKey: widget.listKey, listCart: widget.listCart,tag: widget.product!.urlPhoto,),
                customPageRoute: PageRouteBuilder(
                    pageBuilder: (context,animation, anotherAnimation){
                      return DetailsShoe(product: widget.product,listKey: widget.listKey, listCart: widget.listCart,tag: widget.product!.urlPhoto,);
                    },
                    transitionDuration: Duration(milliseconds: 1000),
                    reverseTransitionDuration: Duration(milliseconds: 700),
                    transitionsBuilder:
                        (context, animation, anotherAnimation, child) {
                      animation = CurvedAnimation(
                          curve: Curves.ease, parent: animation);
                      return  SlideTransition(
                        position: Tween(
                            begin: Offset(0.0, 1),
                            end: Offset(0.0, 0))
                            .animate(animation),
                        child: FadeTransition(
                          opacity: Tween<double>(
                              begin: 0,
                              end: 1
                          ).animate(animation),
                          child: child,
                        ),
                      );
                    }),
                withNavBar: false);
            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsShoe(shoe: shoe,)));
          },
          child: Column(
            children: [
              Expanded(
                  flex: 20,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(widget.product!.urlPhoto!)
                        )
                    ),
                  )),
              Expanded(
                  flex: 7,
                  child: Column(

                    children: [
                      Text(widget.product!.name! ,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(color: Color(0xff021041), fontSize: 15, fontWeight: FontWeight.bold),),
                      Spacer(),
                      Container(
                        margin: const EdgeInsets.only(bottom: 3),
                        padding: const EdgeInsets.only(left: 5,right: 5,),
                        child: Row(
                          children: [
                            Text("\$"+widget.product!.price!, style: TextStyle(
                                color: Color(0xff000000).withOpacity(0.5),
                                fontSize: 11,
                                fontWeight: FontWeight.bold
                            ),
                            ),
                            Spacer(),
                            Text(widget.product!.type!, style: TextStyle(
                                color: Color(0xff000000).withOpacity(0.5),
                                fontSize: 11,
                                fontWeight: FontWeight.bold
                            ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
