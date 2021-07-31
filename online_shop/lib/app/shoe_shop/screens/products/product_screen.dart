import 'package:flutter/material.dart';
import 'package:online_shop/app/shoe_shop/model/response_product_model.dart';
import 'package:online_shop/app/shoe_shop/screens/root_screen/provider/cart_provider.dart';
import 'package:online_shop/data_source/api_service/api_service.dart';
import 'package:online_shop/data_source/assets_link/assets_links.dart';
import 'package:online_shop/generated/l10n.dart';
import 'package:provider/provider.dart';

import 'item_product.dart';
// ignore: must_be_immutable
class SearchScreen extends StatefulWidget {
  GlobalKey<AnimatedListState>? listKey;

   SearchScreen({Key? key, this.listKey}) : super(key: key);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _mainBody(context),
    );
  }

  _mainBody(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppBar().preferredSize.height,),
        _searchBar(context),
        _gridViewMain(context),

      ],
    );
  }

  _searchBar(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,),
            child: Column(
              children: [
                Container(
                  height: 35,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      hintText: S.current!.search,
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Color(0xff2329D6),size: 24,)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Divider(thickness: 1,color: Color(0xffC4C4C4),),
                )
              ],
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Image.asset(IconsLinks().filter, height: 24,))
      ],
    );
  }

  _gridViewMain(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
        child: FutureBuilder<ResponseProduct>(
          future: ShoeApiService().getListShoe(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              if(snapshot.data!.list!=null){
                return  GridView.builder(
                    itemCount: snapshot.data!.list!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width~/180>2 ? 3: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.69
                    ),
                    itemBuilder: (context, index){
                      return Consumer<CartProvider>(
                        builder: (context, cartPrv, child){
                          return ItemProduct(product: snapshot.data!.list![index],listKey: widget.listKey,listCart: cartPrv.listCart,);
                        });

                    });
              }
              else{
                return Container();
              }
            }
            else{
              return Center(child: CircularProgressIndicator());
            }

          },)
      ),
    );
  }
}
