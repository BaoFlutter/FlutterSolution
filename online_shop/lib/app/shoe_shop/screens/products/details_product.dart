import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/app/shoe_shop/model/cart_model.dart';
import 'package:online_shop/app/shoe_shop/model/response_product_model.dart';
import 'package:online_shop/app/shoe_shop/screens/root_screen/provider/cart_provider.dart';
import 'package:online_shop/app/shoe_shop/screens/widget/src/add_to_cart_button.dart';
import 'package:online_shop/app/shoe_shop/screens/widget/src/cart_widget.dart';
import 'package:online_shop/app/shoe_shop/screens/widget/src/favourite_widget.dart';
import 'package:online_shop/data_source/database/src/cart_database_provider.dart';
import 'package:online_shop/generated/l10n.dart';
import 'package:provider/provider.dart';

import 'selected_color.dart';

// ignore: must_be_immutable
class DetailsShoe extends StatefulWidget {
  GlobalKey<AnimatedListState>? listKey;
  List<Cart>? listCart;
  final Product? product;
  String? tag;
   DetailsShoe({Key? key, this.product, this.listKey, this.listCart, this.tag}) : super(key: key);
  @override
  _DetailsShoeState createState() => _DetailsShoeState();
}

class _DetailsShoeState extends State<DetailsShoe> {
  int colorIndex = 0;
  List<bool> choiceSizes =[];
  GlobalKey<CartWidgetState> cartKey = GlobalKey<CartWidgetState>();
  GlobalKey sizeKey = GlobalKey();
  String size = "40";
  @override
  void initState() {
    _setListChoiceSize();
    super.initState();
  }

  _setListChoiceSize(){
    for(int i = 0 ; i <  widget.product!.size!.length; i++){
      if(i >0){
        choiceSizes.add(false);
      }else{
        choiceSizes.add(true);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainBody(context),
    );
  }

  _mainBody(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            _sliverAppbar(context),
            _sliverBody(context)
          ],
        ),
        Positioned(
          bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20) ,topRight: Radius.circular(20)),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width/2,
                            child: AutoSizeText(widget.product!.name!,
                                  maxLines: 2,
                                  minFontSize: 1,
                              style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
                       Spacer(),
                        AutoSizeText("\$"+widget.product!.price!,
                          maxLines: 1,
                          minFontSize: 1,
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.red),)
                      ],
                    ),
                    SizedBox(height: 3,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                        child: Text(widget.product!.type!,style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.5)),)),
                    SizedBox(height: 20,),
                   AddToCartButton(cartKey: cartKey,
                     onAddToCart: (){

                     _onAddToCart(context,widget.product!.id!, Cart(
                       id: widget.product!.id,
                       idCategoryProduct: widget.product!.idCategoryProduct,
                       name: widget.product!.name,
                       urlPhoto: widget.product!.othersImage![colorIndex].urlPhoto![0],
                       color:  widget.product!.othersImage![colorIndex].color,
                       type: widget.product!.type,
                       size: size,
                       amount: 1,
                       price: int.parse(widget.product!.price!),
                     ));
                   },)
                  ],
                ),
              ),
            ))
      ],
    );
  }

  _sliverAppbar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.white,
      expandedHeight: MediaQuery.of(context).size.height/2.5,
      iconTheme: IconThemeData(color: Colors.black),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Hero(
            tag: widget.tag!,
            child: CachedNetworkImage(imageUrl: widget.product!.othersImage![colorIndex].urlPhoto![0],fit: BoxFit.cover,)),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: CartWidget(key: cartKey,listKey: widget.listKey,listCart: widget.listCart!,),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20,left: 10),
          child: FavouriteWidget(),
        )
      ],
    );
  }

  _sliverBody(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10,right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SelectedColor(othersImage: widget.product!.othersImage,
                callBackColor: (val){
                  setState(() {
                    colorIndex = val;
                  });
                },),
                Spacer(),
                _selectedSize(context)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0),
            height: 160,
            child: ListView.builder(
                itemCount: widget.product!.othersImage![colorIndex].urlPhoto!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return _itemMoreImage(context,index);
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10),
            child: Text(S.current!.about, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10,right: 20),
            child: Text(widget.product!.description!, style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal, color: Colors.black.withOpacity(0.5)),),
          ),
          SizedBox(height: 180,)
        ],
      ),
    );
  }

  _itemMoreImage(BuildContext context, int index) {
    return Container(
      height: 150,
      width: 120,
      margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(widget.product!.othersImage![colorIndex].urlPhoto![index])
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xff000000).withOpacity(0.25),
              offset: Offset(2,2),
              blurRadius: 4
            )
          ]
      ),
    );
  }

  _selectedSize(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (val){
        setState(() {
          size = val;
        });
      },
      itemBuilder: (context) => List.generate(widget.product!.size!.length, (index) =>
          PopupMenuItem<String>(
          value: widget.product!.size![index],
          child: Center(child: Text(widget.product!.size![index])))),
      child: Container(
        key: sizeKey,
        alignment: Alignment.center,
        height: 35,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey.shade300
        ),
        child: Text("Size $size"),
      ),
    );
  }

  _onAddToCart(BuildContext context,int id, Cart cart)async{
    List<Cart>? list = await CartDBProvider.db.getListItemInCart();
    if(list!=null){
      if(list.length>0){
        if(list.any((element) => id==element.id)){
          for(int i = 0 ; i < list.length ; i ++){
            if(id == list[i].id){
              Provider.of<CartProvider>(context,listen: false).updateAmount(amount: list[i].amount!+1, index: i);
              await CartDBProvider.db.updateItemCart(amount: list[i].amount! +1, id: id);
            }
          }
        }else{
          Provider.of<CartProvider>(context,listen: false).addCart(cart: cart,listKey: widget.listKey);
          await CartDBProvider.db.insert(cart);

        }
      }else{
        Provider.of<CartProvider>(context,listen: false).addCart(cart: cart,listKey: widget.listKey);
        await CartDBProvider.db.insert(cart);
      }
    }else{
      Provider.of<CartProvider>(context,listen: false).addCart(cart: cart,listKey: widget.listKey);
      await CartDBProvider.db.insert(cart);
    }
  }
}
