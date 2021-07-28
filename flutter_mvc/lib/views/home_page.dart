
import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
import 'package:mvc/controllers/counter_controller.dart';
import 'package:mvc/models/counter_model.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tăng số'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Nhấn nút bên dưới để tăng giá trị biến đếm: ',
            ),
            MomentumBuilder(
              controllers: [CounterController],
              builder: (context, snapshot) {
                var counter = snapshot<CounterModel>();
                return Text(
                  '${counter.value}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      // we don't need to rebuild the increment button, we can skip the MomentumBuilder
      floatingActionButton: FloatingActionButton(
        onPressed: Momentum.controller<CounterController>(context).increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}