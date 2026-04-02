import 'package:flutter_svg/svg.dart';
import 'package:savvisound_v2/constants/app_colors.dart';
import 'package:savvisound_v2/theme/app_theme.dart';
import 'package:savvisound_v2/routes/routes.dart';
import 'package:savvisound_v2/routes/routes_import.dart';
import 'package:savvisound_v2/service/get_it.dart';
import 'package:savvisound_v2/service/navigation_service.dart';
import 'package:savvisound_v2/widgets/animated_semi_circle_progress_widget.dart';
import 'package:savvisound_v2/widgets/liquid_progress_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator(); // Initialize GetIt

  // Initialize Navigation Service
  try {
    final navigationService = NavigationService();
    navigationService.initialize();
    debugPrint('Navigation service initialized');
  } catch (e) {
    debugPrint('Failed to initialize navigation service: $e');
  }
  runApp(const SavviApp());
}

class SavviApp extends StatelessWidget {
  const SavviApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: RoutesName.splash,

      navigatorKey: NavigationService().navigatorKey,
      onGenerateRoute: (settings) {
        return Routes.generateRoute(settings);
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: AnimatedSemiCircleProgress(
                progress: 0.5,
                color: Colors.lightBlue,
                strokeWidth: 5,
                startIcon: SvgPicture.asset(
                  "assets/icons/heart.svg",
                  width: 28,
                  height: 28,
                  color: Colors.lightBlue,
                ),
                endIcon: SvgPicture.asset(
                  "assets/icons/heart.svg",
                  width: 28,
                  height: 28,
                  color: Colors.lightBlue,
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -100),
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
                bottomIconSize: 40,
                bottomIconColor: Colors.blue.shade700,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          child: Icon(Icons.info_outline, size: 50, color: Colors.white),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
