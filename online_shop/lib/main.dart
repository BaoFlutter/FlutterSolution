import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:online_shop/app/shoe_shop/screens/introduction/introduction.dart';
import 'package:online_shop/data_source/database/database.dart';
import 'package:provider/provider.dart';
import 'app/shoe_shop/model/cart_model.dart';
import 'app/shoe_shop/screens/root_screen/provider/cart_provider.dart';
import 'generated/l10n.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  List<Cart>? listCart = await CartDBProvider.db.getListItemInCart();
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_)=>CartProvider(listCart!))
           ],
         child: MyApp(),));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "IBM Plex Sans",
      ),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      home: ShoeShopIntroduction(),
    );
  }
}

