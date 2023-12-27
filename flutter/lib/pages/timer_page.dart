import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_sample/provier/timer_provider.dart';

class TimerPage extends ConsumerWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // タイマーの残り時間を監視
    final duration = ref.watch(timerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('100 Year Timer'),
      ),
      body: Center(
        child: Text(
          formatDuration(duration),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }

  // Durationを読みやすい形式にフォーマットする関数
  String formatDuration(Duration duration) {
    return '${duration.inDays} days ${duration.inHours.remainder(24)} hours ${duration.inMinutes.remainder(60)} minutes ${duration.inSeconds.remainder(60)} seconds';
  }
}
