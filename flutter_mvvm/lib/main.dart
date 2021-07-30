import 'package:flutter/material.dart';
import 'package:mvvm/view_models/user_list_view_model.dart';
import 'package:mvvm/views/user_list_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>UserListViewModel()),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserListScreen(),
      ),

    );
  }
}

