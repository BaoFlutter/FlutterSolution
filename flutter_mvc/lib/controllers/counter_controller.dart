import 'package:momentum/momentum.dart';
import 'package:mvc/models/counter_model.dart';

class CounterController extends MomentumController<CounterModel> {
  @override
  CounterModel init() {
    return CounterModel(
      this,
      value: 0,
    );
  }

  void increment() {
    var value = model.value; // grab the current value
    model.update(value: value! + 1); // update state (rebuild widgets)
    print(model.value); // new or updated value
  }
}