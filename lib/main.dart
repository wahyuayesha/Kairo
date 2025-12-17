import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kairo/view/bindings/injection.dart';
import 'package:kairo/view/pages/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: Splashscreen(), debugShowCheckedModeBanner: false);
  }
}
