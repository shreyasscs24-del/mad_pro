import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants/app_colors.dart';
import 'screens/main_scaffold.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.navBarBg,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const SkillTimeApp());
}

class SkillTimeApp extends StatelessWidget {
  const SkillTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkillTime',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.dark(
          primary: AppColors.accentPink,
          surface: AppColors.cardDark,
        ),
        useMaterial3: true,
      ),
      home: const MainScaffold(),
    );
  }
}
