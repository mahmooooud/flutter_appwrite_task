import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_appwrite_task/core/theme/app_theme_dark.dart';
import 'package:flutter_appwrite_task/core/theme/app_theme_light.dart';
import 'package:flutter_appwrite_task/feature/list_data/presentation/list_data_imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]);
  await ScreenUtil.ensureScreenSize();
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context,child){
        return AdaptiveTheme(
            light: AppThemeLight().theme,
            dark: AppThemeDark().theme,
            initial: AdaptiveThemeMode.light,
            builder: (theme, darkTheme) {
              return const MaterialApp(
                debugShowCheckedModeBanner: false,
                showSemanticsDebugger: false,
                debugShowMaterialGrid: false,
                home: ListDataScreen(),
              );
            }
        );
      },
    );
  }
}
