import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerNotifier extends StateNotifier<Duration> {
  Timer? _timer;

  TimerNotifier() : super(const Duration()) {
    _startTimer();
  }

  void _startTimer() {
    // 現在の日時と100年後の日時を計算
    final now = DateTime.now();
    final hundredYearsLater = now.add(const Duration(days: 365 * 100));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      final remaining = hundredYearsLater.difference(now);
      state = remaining;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final timerProvider = StateNotifierProvider<TimerNotifier, Duration>((ref) {
  return TimerNotifier();
});
