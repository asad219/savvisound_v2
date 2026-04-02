import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:savvisound_v2/constants/app_colors.dart';

class UpcomingScheduleWidget extends StatelessWidget {
  const UpcomingScheduleWidget({super.key});

  String _formatDate(DateTime d) {
    // e.g., Sat, Nov 29, 2025
    final wd = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"][d.weekday - 1];
    final months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    final m = months[d.month - 1];
    return "$wd, $m ${d.day}, ${d.year}";
  }

  String _formatTime(TimeOfDay t) {
    final hh = t.hourOfPeriod == 0 ? 12 : t.hourOfPeriod;
    final mm = t.minute.toString().padLeft(2, '0');
    final period = t.period == DayPeriod.am ? 'AM' : 'PM';
    return "$hh:$mm $period";
  }

  @override
  Widget build(BuildContext context) {
    final DateTime date = DateTime.now();
    final TimeOfDay time = TimeOfDay.now();
    const int repeatCount = 3;
    const Color backgroundColor = AppColors.mainBg;
    const Color textColor = AppColors.mainBg;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Iconsax.clock,
                  color: AppColors.beigeColor,
                  size: 40,
                ),
              ],
            ),

            // Separator
            _VerticalSeparator(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Date',
                  style: TextStyle(
                    color: AppColors.beigeColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _formatDate(date),
                      style: TextStyle(
                        color: AppColors.beigeColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Separator
            _VerticalSeparator(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Time',
                  style: TextStyle(
                    color: AppColors.beigeColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _formatTime(time),
                  style: TextStyle(
                    color: AppColors.beigeColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            // Separator
            // _VerticalSeparator(),

            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   children: [
            //     const Text(
            //       'Repeat',
            //       style: TextStyle(
            //         color: AppColors.primaryColor,
            //         fontSize: 14,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     const SizedBox(height: 4),
            //     Center(
            //       child: Text(
            //         '${repeatCount}x',
            //         style: TextStyle(
            //           color: textColor,
            //           fontSize: 18,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ],
    );
  }
}

class _VerticalSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: 40,
      width: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.beigeColor.withAlpha(0),
            AppColors.beigeColor.withAlpha(100),
            AppColors.beigeColor.withAlpha(0),
          ],
        ),
      ),
    );
  }
}
