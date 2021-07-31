import 'package:flutter/material.dart';
import 'package:online_shop/data_source/assets_link/assets_links.dart';

class FavouriteWidget extends StatefulWidget {
  @override
  _FavouriteWidgetState createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(IconsLinks().outlineFavourite,height: 24,width: 24,);
  }
}
