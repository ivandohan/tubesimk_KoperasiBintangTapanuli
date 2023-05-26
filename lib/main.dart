import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/auth_factory.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/location_factory.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/on_boarding/on_boarding_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/initialize/initialize_first_open.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/utils/theme/theme.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) =>
    Get.put(AuthFactory())
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(LocationFactory());
    return GetMaterialApp(
      title: 'Koperasi Bintang Tapanuli',
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: const InitializeFirstOpen(),
    );
  }
}
