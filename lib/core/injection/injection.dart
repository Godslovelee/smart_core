import 'package:get_it/get_it.dart';

import '../../home/view/home_screen_view_model.dart';
import '../../home/view/smart_ac_view_model.dart';
import '../../home/view/smart_fan_view_model.dart';
import '../../home/view/smart_light_view_model.dart';
import '../../home/view/smart_speaker_view_model.dart';
import '../../home/view/smart_tv_view_model.dart';
import '../../routes/navigation.dart';

GetIt getIt = GetIt.instance;

void setUp() {
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerFactory(() => HomeScreenViewModel());
  getIt.registerFactory(() => SmartLightViewModel());
  getIt.registerFactory(() => SmartACViewModel());
  getIt.registerFactory(() => SmartSpeakerViewModel());
  getIt.registerFactory(() => SmartFanViewModel());
  getIt.registerFactory(() => SmartTvViewModel());
}
