import 'package:flutter/material.dart';
import 'package:online_shop/app/shoe_shop/model/cart_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class CartDBProvider {
   static Database? _database;
    CartDBProvider._();
    static final CartDBProvider db = CartDBProvider._();
    final String _table = "CART";


    Future<Database?> get database async {
      if (_database != null) return _database;
      // if _database is null we instantiate it
      _database = await initializeDatabase();
      return _database;
    }

  initializeDatabase() async{
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "cart.db");
    var bomDataTable = await openDatabase(path, version: 1, onOpen: (db){},
        onCreate: (Database db, int version) async{
          await db.execute("CREATE TABLE IF NOT EXISTS $_table "
              "(privateID INTEGER PRIMARY KEY AUTOINCREMENT,"
              "id INTEGER,"
              "id_category_product INTEGER,"
              "name TEXT,"
              "type TEXT,"
              "url_photo TEXT,"
              "color TEXT,"
              "size TEXT,"
              "price INTEGER,"
              "amount INTEGER)");
        }
    );
    return bomDataTable;
  }


  Future<List<Cart>?> getListItemInCart() async {
    final db = await database;
    var res = await db!.query(_table);
    List<Cart> listCart = [];
    for(Map<String, dynamic> i in res){
      Cart cart = Cart.fromJson(i);
      listCart.add(cart);
    }
    return res.isNotEmpty ? listCart : [];
  }


    insert(Cart cart) async {
      final db = await database;
      var res = await db!.insert(_table,cart.toJson());
      return res;
    }


    updateItemCart({
      @required int? amount,
      @required int? id

    }) async{
      final db= await database;
      var res = await db!.rawUpdate('''
      UPDATE $_table
      SET amount = ? 
      WHERE id = ?
      ''',
          [amount,id]
      );
      print(res);
    }

    delete(int id)async{
      final db = await database;
      db!.delete("$_table", where: "id = ?", whereArgs: [id]);
    }

}