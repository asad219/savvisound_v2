import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:savvisound_v2/constants/app_colors.dart';
import 'package:savvisound_v2/widgets/box_container_widget.dart';
import 'package:savvisound_v2/widgets/chip_widget.dart';
import 'package:savvisound_v2/widgets/dashboard_app_bar_widget.dart';
import 'package:savvisound_v2/widgets/sound_player_widget.dart';
import 'package:savvisound_v2/widgets/upcoming_schedule_widget.dart';
import 'package:savvisound_v2/widgets/weight_goal_widget.dart';
import 'package:savvisound_v2/widgets/welcome_message_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: DashboardAppBar(isDashboard: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeMessageWidget(
                userName: 'Moeez',
                welcomeTextColor: AppColors.mainBg,
                nameTextColor: AppColors.mainBg,
              ),
              BoxContainerWidget(
                child: SoundPlayerWidget(
                  repeatCount: 1,
                  progress: Duration.zero,
                  totalDuration: const Duration(minutes: 3),
                  url:
                      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
                ),
              ),

              BoxContainerWidget(
                titleWidget: ChipWidget(
                  icon: Icon(
                    Iconsax.calendar,
                    size: 20,
                    color: AppColors.whiteColor,
                  ),
                  title: "View All",
                ),

                boxTitle: "Upcoming Schedule",
                backgroundColor: AppColors.mainBg,
                child: UpcomingScheduleWidget(),
              ),
              BoxContainerWidget(
                titleWidget: ChipWidget(
                  icon: Icon(
                    Icons.water_drop_outlined,
                    size: 20,
                    color: AppColors.whiteColor,
                  ),
                  title: "Add Hydration",
                ),

                boxTitle: "Weight & Goal",
                backgroundColor: AppColors.mainBg,
                child: WeightGoalWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}











// titleWidget: Chip(
                //   backgroundColor: AppColors.mainBg,
                //   side: BorderSide.none,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(20.0),
                //   ),

                //   label: Row(
                //     mainAxisSize: MainAxisSize.min,
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Container(
                //         width: 28,
                //         height: 28,
                //         decoration: BoxDecoration(
                //           color: AppColors.whiteColor.withAlpha(40),
                //           shape: BoxShape.circle,
                //         ),
                //         child: const Icon(
                //           Icons.calendar_month,
                //           color: AppColors.whiteColor,
                //           size: 16,
                //         ),
                //       ),
                //       const SizedBox(width: 8),
                //       const Text(
                //         'View All',
                //         style: TextStyle(color: AppColors.whiteColor),
                //       ),
                //     ],
                //   ),
                // ),




                 // Container(
              //   height: 200,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     color: AppColors.mainBg.withAlpha(20),
              //     borderRadius: BorderRadius.circular(12),
              //   ),
              //   child: const Center(
              //     child: Text(
              //       'Additional Dashboard Content Here',
              //       style: TextStyle(color: AppColors.mainBg, fontSize: 18),
              //     ),
              //   ),
              // ),