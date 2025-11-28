import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:savvisound_v2/constants/app_colors.dart';
import 'package:savvisound_v2/widgets/box_container_widget.dart';
import 'package:savvisound_v2/widgets/dashboard_app_bar_widget.dart';
import 'package:savvisound_v2/widgets/sound_player_widget.dart';
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
      appBar: DashboardAppBar(),
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
                  onPlay: () {},
                  onIncrease: () {},
                  onDecrease: () {},
                  progress: Duration.zero,
                  totalDuration: Duration(minutes: 3),
                ),
              ),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.mainBg.withAlpha(20),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'Additional Dashboard Content Here',
                    style: TextStyle(color: AppColors.mainBg, fontSize: 18),
                  ),
                ),
              ),
              BoxContainerWidget(
                titleWidget: Icon(Iconsax.calendar),
                height: 200,
                boxTitle: "Title Here",
                backgroundColor: AppColors.mainBg,
                child: Text("data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
