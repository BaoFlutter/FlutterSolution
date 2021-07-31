import 'package:shared_preferences/shared_preferences.dart';

class CartSharedPrf {

  CartSharedPrf._();

  static final CartSharedPrf sharedPrf = CartSharedPrf._();

  final String itemCartKey = "ITEMCARTKEY";

  Future<bool> setSeenItemCart (bool value)async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setBool(itemCartKey, value);
  }
  Future<bool?> getSeenItemCart ()async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(itemCartKey);
  }

}