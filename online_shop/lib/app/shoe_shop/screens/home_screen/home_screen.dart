import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/app/shoe_shop/model/response_product_model.dart';
import 'package:online_shop/app/shoe_shop/screens/products/details_product.dart';
import 'package:online_shop/app/shoe_shop/screens/root_screen/provider/cart_provider.dart';
import 'package:online_shop/data_source/api_service/api_service.dart';
import 'package:online_shop/generated/l10n.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  GlobalKey<AnimatedListState>? listKey;

   HomeScreen({Key? key, this.listKey}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> listProduct  = [];
  @override
  void initState() {
    _getListShoe();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainBody(context),
    );
  }

  _mainBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _appBar(context),
        _body(context)
      ],
    );
  }

  _appBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      expandedHeight: MediaQuery.of(context).size.height/2.3,
      iconTheme: IconThemeData(color: Colors.black),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Container(
          height: MediaQuery.of(context).size.height/2.3,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(height: MediaQuery.of(context).size.height/2.3, color: Color(0xffF2F2F2),),
              Positioned(
                bottom: 0,
                child: Transform.rotate(
                    angle: -0.13,
                    child: Image.asset("assets/images/shoe.png", width: MediaQuery.of(context).size.width-100,)),
              ),
              Positioned(
                  left: 25,
                  top: AppBar().preferredSize.height+20,
                  child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(text: S.current!.hello, style: TextStyle(fontSize: 15,)),
                            TextSpan(text: "\nJames", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ]
                      ))),
              Positioned(
                  right: 25,
                  top: AppBar().preferredSize.height,
                  child: Icon(Icons.notifications_none_outlined, size: 24,))
            ],
          ),
        ),
      ),
    );
  }

  _body(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(height: 10,),
          _tileMain(context, S.current!.bestseller, S.current!.see_more),
          SizedBox(height: 10,),
          _listSelling(context),
          SizedBox(height: 10,),
          _tileMain(context, S.current!.latest, S.current!.see_more),
          SizedBox(height: 10,),
          _listNew(context),
          SizedBox(height: 10,),
          _tileMain(context, S.current!.for_you, S.current!.see_more),
          SizedBox(height: 10,),
          _listRecommend(context),
          SizedBox(height: 30,),
        ],
      ),
    );
  }

  _tileMain(BuildContext context, String tile, String sub){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(tile, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
          Text(sub, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xff0025A7)),),
        ],
      ),
    );
  }

  _listSelling(BuildContext context) {
    return Container(
      height: 180,
      child: listProduct.length>0? ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return _itemSelling(context,index, 127);
          }): Center(child: CircularProgressIndicator(),),
    );
  }

  _itemSelling(BuildContext context, int index, double width) {
    return Hero(
      tag: listProduct[index].urlPhoto!+width.toString(),
      child: Container(
        margin: EdgeInsets.only(left: 12),
        child: Consumer<CartProvider>(
          builder: (context, cartPrv, child){
            return FlatButton(
              padding: EdgeInsets.zero,
              onPressed: (){
                pushNewScreen(context,
                    screen: DetailsShoe(product: listProduct[index], listKey: widget.listKey, listCart: cartPrv.listCart,tag: listProduct[index].urlPhoto!+width.toString(),),
                    customPageRoute: PageRouteBuilder(
                        pageBuilder: (context,animation, anotherAnimation){
                          return DetailsShoe(product: listProduct[index], listKey: widget.listKey, listCart: cartPrv.listCart,tag: listProduct[index].urlPhoto!+width.toString(),);
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
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: width,
                    height: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(listProduct[index].urlPhoto!)
                        )
                    ),
                  ),
                  Container(
                      width: width,
                      child: Text(listProduct[index].name!, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Color(0xff021041)),)),
                  Container(
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$"+listProduct[index].price!, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Color(0xff000000).withOpacity(0.5)),),
                         width>=160? Text(listProduct[index].type!, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Color(0xff000000).withOpacity(0.5)),):Container(),
                        ],
                      ))
                ],
              ),
            );
          },

        ),
      ),
    );
  }


  void _getListShoe() async{
    ResponseProduct responseProduct = await ShoeApiService().getListShoe();
    setState(() {
      listProduct = responseProduct.list!;
    });
  }

  _listNew(BuildContext context) {
    return Container(
      height: 200,
      child: listProduct.length>0? ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return _itemSelling(context, index, 160);
          }):Center(child: CircularProgressIndicator(),),
    );
  }

  _listRecommend(BuildContext context) {
    return Container(
      height: 250,
      child: listProduct.length>0? ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return _itemSelling(context, index, 200);
          }):Center(child: CircularProgressIndicator(),),
    );
  }
}
