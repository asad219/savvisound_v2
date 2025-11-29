import 'package:savvisound_v2/views/hydrate/hydrate_screen.dart';

import 'routes_import.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
      case '/hydrate':
        return MaterialPageRoute(
          builder: (_) => const HydrateScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
