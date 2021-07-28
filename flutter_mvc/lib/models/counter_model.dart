import 'package:momentum/momentum.dart';
import 'package:mvc/controllers/counter_controller.dart';

class CounterModel extends MomentumModel<CounterController> {
  CounterModel(
      CounterController controller, {
        this.value,
      }) : super(controller);

  final int? value;

  @override
  void update({
    int? value,
  }) {
    CounterModel(
      controller,
      value: value ?? this.value,
    ).updateMomentum();
  }
}