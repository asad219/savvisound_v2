import 'package:flutter/material.dart';

class GradientBody extends StatefulWidget {
  Widget child;
  bool isGradient;
  GradientBody({super.key, required this.child, this.isGradient = true});

  @override
  State<GradientBody> createState() => _GradientBodyState();
}

class _GradientBodyState extends State<GradientBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage(
            widget.isGradient
                //? "assets/images/appbg.jpg"
                //? "assets/images/bkg-1.jpg"
                ? "assets/images/main-bkg.jpg"
                : "assets/images/appbg-pink.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: widget.child,
    );
  }
}
