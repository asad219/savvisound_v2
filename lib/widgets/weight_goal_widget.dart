import 'package:flutter/material.dart';
import 'package:savvisound_v2/constants/app_colors.dart';

class WeightGoalWidget extends StatelessWidget {
  final String title;
  final String goalWeight;
  final String currentWeight;
  final Color backgroundColor;
  final bool useMetric; // true -> kg + ml, false -> lbs + oz
  final int todayCurrent;
  final int todayTarget;

  const WeightGoalWidget({
    super.key,
    this.title = 'Weight Goal',
    this.goalWeight = '70 kg',
    this.currentWeight = '75 kg',
    this.backgroundColor = AppColors.mainBg,
    this.useMetric = true,
    this.todayCurrent = 30,
    this.todayTarget = 50,
  });

  @override
  Widget build(BuildContext context) {
    final Color textColor = AppColors.mainBg;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            //color: AppColors.whiteColor.withAlpha(20),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Today',
                style: TextStyle(
                  color: AppColors.mainBg,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$todayCurrent oz/$todayTarget oz',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 140,
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(8),
                      value: (todayTarget == 0)
                          ? 0
                          : (todayCurrent / todayTarget).clamp(0, 1),
                      minHeight: 8,
                      backgroundColor: AppColors.mainBg.withAlpha(40),
                      valueColor: const AlwaysStoppedAnimation(
                        AppColors.mainBg,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          height: 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.mainBg.withAlpha(0),
                AppColors.mainBg.withAlpha(100),
                AppColors.mainBg.withAlpha(0),
              ],
            ),
          ),
        ),
        Row(
          children: [
            // Column 1: Current Weight with edit
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  //color: AppColors.whiteColor.withAlpha(20),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Current Weight',
                            style: TextStyle(
                              color: AppColors.mainBg,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            currentWeight,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          // _UnitToggle(
                          //   useMetric: useMetric,
                          //   metricLabel: 'kg',
                          //   imperialLabel: 'lbs',
                          // ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: AppColors.mainBg.withAlpha(30),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: AppColors.mainBg,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Column 2: Goal Hydration
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  //color: AppColors.whiteColor.withAlpha(20),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Hydration Goal',
                      style: TextStyle(
                        color: AppColors.mainBg,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      goalWeight,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    // _UnitToggle(
                    //   useMetric: useMetric,
                    //   metricLabel: 'ml',
                    //   imperialLabel: 'oz',
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
