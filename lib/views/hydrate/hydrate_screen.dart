import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:savvisound_v2/constants/app_colors.dart';
import 'package:savvisound_v2/widgets/box_container_widget.dart';
import 'package:savvisound_v2/widgets/glass_water_animation.dart';
import 'package:savvisound_v2/widgets/update_hydration_widget.dart';

import '../../widgets/dashboard_app_bar_widget.dart';

class HydrateScreen extends StatefulWidget {
  const HydrateScreen({super.key});

  @override
  State<HydrateScreen> createState() => _HydrateScreenState();
}

class _HydrateScreenState extends State<HydrateScreen> {
  double _sliderValue = 10;
  double _animationVersion = 0.0;

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now();
    const List<String> weekdays = [
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
      'Sun',
    ];
    const List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final String formattedDate =
        '${weekdays[today.weekday - 1]}, ${months[today.month - 1]} ${today.day}, ${today.year}';
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: DashboardAppBar(isDashboard: false, title: 'Hydrate'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Restart glass water animation when FAB is pressed
          setState(() {
            _animationVersion += 0.1;
          });
        },
        backgroundColor: AppColors.mainBg,
        shape: const CircleBorder(),
        child: const Icon(Icons.info, color: AppColors.whiteColor, size: 34),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BoxContainerWidget(
              //   boxTitle: "Hydration Overview",
              //   child: Center(
              //     child: Column(
              //       children: [
              //         SizedBox(
              //           height: 240,
              //           child: Stack(
              //             alignment: Alignment.topCenter,
              //             children: [
              //               // Semi-circle at the top with icons
              //               Align(
              //                 alignment: Alignment.topCenter,
              //                 child: AnimatedSemiCircleProgress(
              //                   progress: 0.5,
              //                   color: Colors.lightBlue,
              //                   strokeWidth: 5,
              //                   startIcon: SvgPicture.asset(
              //                     "assets/icons/heart.svg",
              //                     width: 28,
              //                     height: 28,
              //                     colorFilter: ColorFilter.mode(
              //                       AppColors.redWarning,
              //                       BlendMode.srcIn,
              //                     ),
              //                   ),
              //                   endIcon: SvgPicture.asset(
              //                     "assets/icons/drop.svg",
              //                     width: 28,
              //                     height: 28,
              //                     colorFilter: ColorFilter.mode(
              //                       AppColors.tuneColor,
              //                       BlendMode.srcIn,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               // Overlay the liquid progress without affecting layout
              //               Align(
              //                 alignment: Alignment.topCenter,
              //                 child: Padding(
              //                   padding: const EdgeInsets.only(top: 20),
              //                   child: LiquidProgressWidget(
              //                     progress: 0.7,
              //                     displayText: "60/64 oz",
              //                     size: 200,
              //                     progressColor: Colors.blue,
              //                     backgroundColor: Colors.blue.shade50,
              //                     borderColor: Colors.blue.shade200,
              //                     borderWidth: 4.0,
              //                     bottomIcon: SvgPicture.asset(
              //                       "assets/icons/glass-fill.svg",
              //                       colorFilter: ColorFilter.mode(
              //                         AppColors.tuneColor,
              //                         BlendMode.srcIn,
              //                       ),
              //                     ),
              //                     bottomIconSize: 30,
              //                     bottomIconColor: Colors.blue.shade700,
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         const SizedBox(height: 20),
              //         Center(
              //           child: SizedBox(
              //             width: 170,
              //             child: ChipWidget(
              //               icon: Icon(
              //                 Icons.water_drop_outlined,
              //                 size: 20,
              //                 color: AppColors.whiteColor,
              //               ),
              //               title: "Add Hydration",
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Row(
                children: [
                  const Icon(
                    Iconsax.calendar,
                    size: 25,
                    color: AppColors.beigeColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.beigeColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              BoxContainerWidget(
                boxTitle: "Hydration",
                child: UpdateHydrationWidget(
                  value: _sliderValue,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                ),
              ),
              BoxContainerWidget(
                boxTitle: "Hydration History",
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // First column: hydration list
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        // separatorBuilder: (context, index) => Padding(
                        //   padding: const EdgeInsets.only(left: 20),
                        //   child: Row(
                        //     children: [
                        //       SizedBox(
                        //         height: 20,
                        //         child: SvgPicture.asset(
                        //           "assets/icons/vertical-seperator.svg",
                        //           colorFilter: ColorFilter.mode(
                        //             AppColors.mainBg.withAlpha(255),
                        //             BlendMode.srcIn,
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Iconsax.trash,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                              // Container(
                              //   width: 40,
                              //   height: 40,
                              //   decoration: BoxDecoration(
                              //     color: AppColors.tuneColor.withOpacity(0.1),
                              //     shape: BoxShape.circle,
                              //   ),
                              //   child: Center(
                              //     child: SvgPicture.asset(
                              //       "assets/icons/drop.svg",
                              //       width: 20,
                              //       height: 20,
                              //       colorFilter: ColorFilter.mode(
                              //         AppColors.tuneColor,
                              //         BlendMode.srcIn,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              const SizedBox(width: 5),
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
                                    const SizedBox(height: 4),
                                    const Text(
                                      '8 oz',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.mainBg,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Second column: text widget
                    Column(
                      spacing: 10,
                      children: [
                        Text(
                          "Goal Achieved!",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.beigeColor,
                          ),
                        ),
                        SizedBox(
                          height: 150,
                          width: 120,
                          child: WaterGlass(
                            percentage: .5,
                            key: ValueKey(_animationVersion),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
