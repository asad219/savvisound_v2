import 'package:get_it/get_it.dart';
import 'package:savvisound_v2/service/navigation_service.dart';

GetIt getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
}
