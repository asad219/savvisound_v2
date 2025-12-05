import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:savvisound_v2/constants/app_colors.dart';
import 'package:savvisound_v2/widgets/animated_semi_circle_progress_widget.dart';
import 'package:savvisound_v2/widgets/box_container_widget.dart';
import 'package:savvisound_v2/widgets/chip_widget.dart';
import 'package:savvisound_v2/widgets/liquid_progress_widget.dart';

import '../../widgets/dashboard_app_bar_widget.dart';

class HydrateScreen extends StatefulWidget {
  const HydrateScreen({super.key});

  @override
  State<HydrateScreen> createState() => _HydrateScreenState();
}

class _HydrateScreenState extends State<HydrateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: DashboardAppBar(isDashboard: false, title: 'Hydrate'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoxContainerWidget(
                boxTitle: "Hydration Overview",
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 240,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            // Semi-circle at the top with icons
                            Align(
                              alignment: Alignment.topCenter,
                              child: AnimatedSemiCircleProgress(
                                progress: 0.5,
                                color: Colors.lightBlue,
                                strokeWidth: 5,
                                startIcon: SvgPicture.asset(
                                  "assets/icons/heart.svg",
                                  width: 28,
                                  height: 28,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.redWarning,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                endIcon: SvgPicture.asset(
                                  "assets/icons/drop.svg",
                                  width: 28,
                                  height: 28,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.tuneColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                            // Overlay the liquid progress without affecting layout
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: LiquidProgressWidget(
                                  progress: 0.7,
                                  displayText: "60/64 oz",
                                  size: 200,
                                  progressColor: Colors.blue,
                                  backgroundColor: Colors.blue.shade50,
                                  borderColor: Colors.blue.shade200,
                                  borderWidth: 4.0,
                                  bottomIcon: SvgPicture.asset(
                                    "assets/icons/glass-fill.svg",
                                    colorFilter: ColorFilter.mode(
                                      AppColors.tuneColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  bottomIconSize: 30,
                                  bottomIconColor: Colors.blue.shade700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: SizedBox(
                          width: 170,
                          child: ChipWidget(
                            icon: Icon(
                              Icons.water_drop_outlined,
                              size: 20,
                              color: AppColors.whiteColor,
                            ),
                            title: "Add Hydration",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              BoxContainerWidget(
                boxTitle: "Today's Hydration",
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 20,
                          child: SvgPicture.asset(
                            "assets/icons/vertical-seperator.svg",
                            colorFilter: ColorFilter.mode(
                              AppColors.mainBg.withAlpha(255),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.tuneColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/icons/drop.svg",
                              width: 20,
                              height: 20,
                              colorFilter: ColorFilter.mode(
                                AppColors.tuneColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${8 + index}:00 AM',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.mainBg,
                                ),
                              ),
                              Text(
                                '8 oz',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.mainBg,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.trash,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
