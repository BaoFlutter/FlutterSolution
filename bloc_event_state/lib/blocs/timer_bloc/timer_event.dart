import 'package:equatable/equatable.dart';

class TimerEvent extends Equatable {
  const TimerEvent();
  @override
  List<Object> get props => [];
}

// Sự kiện bắt đầu
class TimerStarted extends TimerEvent {
  final int duration;
  TimerStarted(this.duration);
}

// Sự kiện chạy
class TimerStepRun extends TimerEvent {
  final int duration;
  TimerStepRun(this.duration);
}

//Sự kiện tạm dừng
class TimerPause extends TimerEvent {}

//Sự kiện tiếp tục
class TimerResume extends TimerEvent {}

//Sự kiện đặt lại
class TimerReset extends TimerEvent {}