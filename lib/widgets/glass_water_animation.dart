import 'package:savvisound_v2/routes/routes_import.dart';

class WaterGlass extends StatefulWidget {
  final double percentage; // value between 0.0 - 1.0

  const WaterGlass({super.key, required this.percentage});

  @override
  State<WaterGlass> createState() => _WaterGlassState();
}

class _WaterGlassState extends State<WaterGlass>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightFactor;
  double _lastPercentage = 0.0;

  @override
  void initState() {
    super.initState();
    _lastPercentage = widget.percentage.clamp(0.0, 1.0);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _heightFactor = Tween<double>(
      begin: _lastPercentage,
      end: _lastPercentage,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void didUpdateWidget(covariant WaterGlass oldWidget) {
    super.didUpdateWidget(oldWidget);
    final double newPct = widget.percentage.clamp(0.0, 1.0);
    if (newPct != _lastPercentage) {
      _controller.stop();
      _heightFactor = Tween<double>(
        begin: _lastPercentage,
        end: newPct,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
      _lastPercentage = newPct;
      _controller
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double glassHeight = constraints.maxHeight;
        final double glassWidth = constraints.maxWidth;

        // Fallback in case of unbounded constraints
        if (glassHeight == 0 || glassWidth == 0) {
          return const SizedBox.shrink();
        }

        return AnimatedBuilder(
          animation: _heightFactor,
          builder: (context, child) {
            final double factor = _heightFactor.value;
            final double waterHeight = glassHeight * factor;

            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // Glass outline with tapered shape
                CustomPaint(
                  size: Size(glassWidth, glassHeight),
                  painter: _GlassOutlinePainter(),
                ),

                // Water fill clipped exactly to glass shape, height animated
                ClipPath(
                  clipper: _GlassClipper(),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: waterHeight,
                      width: glassWidth,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.lightBlueAccent.withOpacity(0.7),
                              Colors.blueAccent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Percentage text fixed in the vertical center of the glass
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '${(widget.percentage * 100).toInt()}%',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(0, 1),
                          blurRadius: 3,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _GlassClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    // Wider at the top, narrower at the bottom
    final double topWidth = size.width;
    final double bottomWidth = size.width * 0.7;
    final double bottomInset = (topWidth - bottomWidth) / 2;

    // Tapered glass shape (trapezoid)
    path.moveTo(0, 0); // top-left
    path.lineTo(topWidth, 0); // top-right
    path.lineTo(topWidth - bottomInset, size.height); // bottom-right
    path.lineTo(bottomInset, size.height); // bottom-left
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _GlassOutlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path path = _GlassClipper().getClip(size);

    final Paint paint = Paint()
      ..color = Colors.white.withOpacity(0.9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Outer glass outline
    canvas.drawPath(path, paint);

    // Optional inner highlight line
    final Paint highlightPaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final Path highlightPath = Path();
    final double inset = 6;
    highlightPath.moveTo(inset, size.height * 0.15);
    highlightPath.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.05,
      size.width * 0.35,
      0,
    );

    canvas.drawPath(highlightPath, highlightPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
