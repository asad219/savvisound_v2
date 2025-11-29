import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:savvisound_v2/constants/app_colors.dart';
import 'package:savvisound_v2/constants/app_constants.dart';

class SoundPlayerWidget extends StatefulWidget {
  final int repeatCount;
  final VoidCallback? onPlay;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;
  final Duration progress;
  final Duration totalDuration;
  final String? url;

  const SoundPlayerWidget({
    super.key,
    required this.repeatCount,
    this.onPlay,
    this.onIncrease,
    this.onDecrease,
    required this.progress,
    required this.totalDuration,
    this.url,
  });

  @override
  State<SoundPlayerWidget> createState() => _SoundPlayerWidgetState();
}

class _SoundPlayerWidgetState extends State<SoundPlayerWidget> {
  late final AudioPlayer _player;
  bool _isPlaying = false;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _listen();
    _setSource();
  }

  Future<void> _setSource() async {
    try {
      if (widget.url != null) {
        await _player.setUrl(widget.url!);
      }
    } catch (_) {}
  }

  void _listen() {
    _player.playerStateStream.listen((state) {
      final playing = state.playing;
      if (mounted) setState(() => _isPlaying = playing);
    });
    _player.positionStream.listen((p) {
      if (mounted) setState(() => _position = p);
    });
    _player.durationStream.listen((d) {
      if (d != null && mounted) setState(() => _duration = d);
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  double get _progressValue {
    final totalMs =
        (_duration == Duration.zero ? widget.totalDuration : _duration)
            .inMilliseconds;
    final posMs = (_position == Duration.zero ? widget.progress : _position)
        .inMilliseconds;
    if (totalMs == 0) return 0;
    return (posMs / totalMs).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    double progressValue = _progressValue;

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
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.mainBg.withAlpha(255),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "${widget.repeatCount}x",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
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
                    splashColor: AppColors.transparent,
                    onTap: () async {
                      if (_isPlaying) {
                        await _player.pause();
                      } else {
                        await _player.play();
                        widget.onPlay?.call();
                      }
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: AppColors.mainBg,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 32,
                        color: AppColors.inputBorderColor,
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
                    "${_format(_position == Duration.zero ? widget.progress : _position)} / ${_format(_duration == Duration.zero ? widget.totalDuration : _duration)}",
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
  // (counter button removed, not used)

  // Format duration mm:ss
  String _format(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inMinutes)}:${twoDigits(d.inSeconds % 60)}";
  }
}
