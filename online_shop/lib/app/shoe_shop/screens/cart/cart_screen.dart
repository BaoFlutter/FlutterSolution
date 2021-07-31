import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:online_shop/app/shoe_shop/model/cart_model.dart';
import 'package:online_shop/app/shoe_shop/screens/payment/selected_location_screen.dart';
import 'package:online_shop/app/shoe_shop/screens/root_screen/provider/cart_provider.dart';
import 'package:online_shop/data_source/assets_link/assets_links.dart';
import 'package:online_shop/data_source/database/database.dart';
import 'package:online_shop/data_source/database/src/cart_database_provider.dart';
import 'package:online_shop/generated/l10n.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import 'item_cart.dart';

// ignore: must_be_immutable
class CartScreen extends StatefulWidget {
  GlobalKey<AnimatedListState>? listKey;
  bool isFromNav;
   CartScreen({Key? key, this.listKey, this.isFromNav=false}) : super(key: key);
  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> with TickerProviderStateMixin {
  @override
  void initState() {

    super.initState();
  }
  GlobalKey<AnimatedListState> listKey =  GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(ImageLinks().creditCardBackground),context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(S.current!.cart, style: TextStyle(color: Colors.black),),
      ),
      body: _mainBody(context),
    );
  }

  _mainBody(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context,cartPrv, child){
        return cartPrv.listCart!=null ?
        cartPrv.listCart.length>0?
        Stack(
          children: [
            AnimatedList(
                key: widget.isFromNav? widget.listKey:listKey,
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 155),
                initialItemCount: cartPrv.listCart.length ,
                itemBuilder: (context, index, animation){
                  return ItemCart(
                    index: index,
                    cart: cartPrv.listCart[index],
                    onChange: (val)async{
                      cartPrv.listCart[index].amount = val;
                      await CartDBProvider.db.updateItemCart(amount: val, id: cartPrv.listCart[index].id);
                      Provider.of<CartProvider>(context,listen: false).changePrice();
                    },
                    onDelete: (id){
                      setState(() {
                        _deleteItem(context, index, id);
                      });

                    },
                  );
                }),
            Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(0) ,topRight: Radius.circular(0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(2,-2),
                            blurRadius: 5
                        )
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                child: AutoSizeText("${S.current!.total} :",
                                  maxLines: 2,
                                  minFontSize: 1,
                                  style: TextStyle(fontSize: 20,),)),
                            SizedBox(height: 10,),
                            AutoSizeText(_totalPrice(cartPrv.listCart),
                              maxLines: 1,
                              minFontSize: 1,
                              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.red),)
                          ],
                        ),

                        FlatButton(onPressed: (){
                          pushNewScreen(context,screen: SelectedLocationScreen(),
                          withNavBar: false);
                        },
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight:  Radius.circular(12),bottomLeft:  Radius.circular(12),bottomRight:  Radius.circular(4) )
                            ),
                            padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                            child: AutoSizeText(S.current!.checkout, minFontSize: 1, maxLines: 1,style: TextStyle(color: Colors.white,fontSize: 18),))
                      ],
                    ),
                  ),
                ))
          ],
        ):Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(IconsLinks().emptyCart,width: MediaQuery.of(context).size.width/2,),
            SizedBox(height: 20,),
            Text("Empty Cart", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
          ],
        ),)
            :Center(child: CircularProgressIndicator());
      },
    );
  }
  _totalPrice(List<Cart> list){
    int price = 0;
    for(var l in list){
      price = price+ l.price!*l.amount!;
    }
    var f = NumberFormat("###.0#", 'en_US');
    return "\$"+f.format(price);
  }
  _deleteItem(BuildContext context, int index, int id)async{
    await CartDBProvider.db.delete(id);
   Provider.of<CartProvider>(context,listen: false).deleteCart(index: index, listKey: listKey,listKeyNav: widget.listKey!,isNav: widget.isFromNav);
  }
}

