import 'package:budget_tracker/routes/bindings/home_binding.dart';
import 'package:budget_tracker/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'constants/theme.dart';
import '../../providers/db_provider.dart';
import 'providers/db_provider_goals.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DatabaseProvider.initDb();
  await DatabaseProviderGoals.initDb();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Themes.lightTheme,
          initialRoute: Routes.splashScreen,
          getPages: AppRoute.routes,
          initialBinding: HomeBinding(),
        );
      },
    );
  }
}
