import 'package:flutter/material.dart';

import 'views/user_list_screen.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Flutter MVP',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new UserListScreen(),
    );

  }

}
