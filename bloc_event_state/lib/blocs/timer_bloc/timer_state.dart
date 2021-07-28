import 'package:equatable/equatable.dart';
class TimerState extends Equatable {
  final int duration;
  TimerState(this.duration);
  @override
  List<Object> get props => [duration];
}

// Trạng thái khởi tạo
class TimerInitial extends TimerState {
  TimerInitial(int duration) : super(duration);

  @override
  String toString() => "[Initial State] : $duration";
}

// Trạng thái đang trong quá trình chạy
class TimerInProgress extends TimerState {
  TimerInProgress(int duration) : super(duration);
  @override
  String toString() => "[Progress State] : $duration";
}

// Trạng thái đã bị tạm dừng
class TimerStatePaused extends TimerState {
  TimerStatePaused(int duration) : super(duration);

  @override
  String toString() => "[Pause State] : $duration";
}

// Trạng thái đã hoàn thành
class TimerCompleted extends TimerState {
  TimerCompleted() : super(0);
}







