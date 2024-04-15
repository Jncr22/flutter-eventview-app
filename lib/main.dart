import 'package:eventview_application_1/config/router/app_router.dart';
import 'package:eventview_application_1/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main()  async {
    WidgetsFlutterBinding.ensureInitialized();//para evitar la rotacio de la aplicacion
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).getTheme(),
    );
  }
}