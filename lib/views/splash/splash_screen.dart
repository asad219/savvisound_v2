import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:savvisound_v2/common/gradient_body.dart';
import 'package:savvisound_v2/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    // Wait 2 seconds then navigate to Home
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.of(context).pushReplacementNamed(RoutesName.home);
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          GradientBody(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/splash-logo.png",
                    width: 250,
                    height: 150,
                  ).fadeIn(
                    duration: const Duration(milliseconds: 1000),
                    delay: const Duration(milliseconds: 1000),
                  ),
                  SizedBox(
                    width: 320,
                    child:
                        SvgPicture.asset(
                          "assets/images/SavviSoundTM-logo-Text.svg",
                          //colorFilter: const ColorFilter.mode(AppColors.inputBorderColor, BlendMode.srcIn),
                          width: 387,
                        ).fadeIn(
                          duration: const Duration(milliseconds: 1000),
                          delay: const Duration(milliseconds: 1500),
                        ),
                  ),
                ],
              ),
            ),
          ).fadeIn(
            duration: const Duration(milliseconds: 1000),
            delay: const Duration(milliseconds: 500),
          ),
    );
  }
}
