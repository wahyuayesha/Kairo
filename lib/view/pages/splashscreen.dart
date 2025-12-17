import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kairo/core/colors.dart';
import 'package:kairo/view/controllers/wasteInfoController.dart';
import 'package:kairo/view/pages/homepage.dart';

class Splashscreen extends StatefulWidget {
  Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  final Wasteinfocontroller controller = Get.find<Wasteinfocontroller>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadWasteInfo();
    });
  }

  void loadWasteInfo() async {
    await controller.fetchWasteInfo().then((_) {
      Get.off(Homepage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
           gradient: AppColors.backgroundGradinet
          ),
        ),
        Center(child: CircularProgressIndicator())]),
    );
  }
}
