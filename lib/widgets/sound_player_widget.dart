import 'package:flutter/material.dart';
import 'package:savvisound_v2/constants/app_colors.dart';

class SoundPlayerWidget extends StatelessWidget {
  final int repeatCount;
  final VoidCallback onPlay;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  final Duration progress;
  final Duration totalDuration;

  const SoundPlayerWidget({
    super.key,
    required this.repeatCount,
    required this.onPlay,
    required this.onIncrease,
    required this.onDecrease,
    required this.progress,
    required this.totalDuration,
  });

  @override
  Widget build(BuildContext context) {
    double progressValue = progress.inSeconds / totalDuration.inSeconds;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SavviSound",
                    style: TextStyle(
                      color: AppColors.mainBg,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Relaxation & Focus",
                    style: TextStyle(
                      color: AppColors.mainBg.withAlpha(150),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              // Duration
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: AppColors.mainBg.withAlpha(200),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  "${repeatCount} x",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Progress Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progressValue,
              minHeight: 12,
              backgroundColor: Colors.white24,
              valueColor: const AlwaysStoppedAnimation(Colors.white),
            ),
          ),

          const SizedBox(height: 25),

          // Bottom Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Play button + repeat counter
              Row(
                children: [
                  // Play button
                  InkWell(
                    onTap: onPlay,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        size: 32,
                        color: Color(0xFF1D5CF5),
                      ),
                    ),
                  ),
                ],
              ),

              // Progress Time
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("Progress", style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 5),
                  Text(
                    "${_format(progress)} / ${_format(totalDuration)}",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Counter button widget
  Widget _counterButton(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  // Format duration mm:ss
  String _format(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inMinutes)}:${twoDigits(d.inSeconds % 60)}";
  }
}
