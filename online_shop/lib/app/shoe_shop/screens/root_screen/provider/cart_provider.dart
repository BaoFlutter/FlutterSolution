import 'package:flutter/material.dart';
import 'package:online_shop/app/shoe_shop/model/cart_model.dart';

class CartProvider extends ChangeNotifier{
  List<Cart> _listCart =[];
  CartProvider(this._listCart);

  List<Cart> get listCart  => _listCart;



  void addCart({Cart? cart,GlobalKey<AnimatedListState>? listKey})async{
    if(_listCart.length>0){
      _listCart.add(cart!);
      if(listKey!=null){
        listKey.currentState!.insertItem(_listCart.length-1);
      }
         }else{
      _listCart.add(cart!);
    }
    notifyListeners();
  }
  void deleteCart({int? index,GlobalKey<AnimatedListState>? listKey,GlobalKey<AnimatedListState>? listKeyNav ,bool? isNav})async{
    if(!isNav!&&listKeyNav!=null){
      listKey!.currentState!.removeItem(index!, (context, animation) => Container());
      listKeyNav.currentState!.removeItem(index, (context, animation) => Container());
    }else{
      listKeyNav!.currentState!.removeItem(index!, (context, animation) => Container());
    }

    _listCart.removeAt(index);
    notifyListeners();
  }
  void updateAmount({int? amount,int? index})async{
    _listCart[index!].amount = amount!;
    notifyListeners();
  }
  void changePrice()async{
    notifyListeners();
  }


}