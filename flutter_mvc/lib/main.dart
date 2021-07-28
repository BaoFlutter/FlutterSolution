import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';

import 'controllers/counter_controller.dart';
import 'models/counter_model.dart';
import 'views/home_page.dart';

void main() {
  runApp(
    Momentum(
      controllers: [CounterController()],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Momentum State Management',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeWidget(),
    );
  }
}





