import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:kairo/core/colors.dart';
import 'package:kairo/view/controllers/predictControler.dart';
import 'package:kairo/view/widgets/riwayat_button.dart';

class Riwayat extends StatelessWidget {
  const Riwayat({super.key});

  @override
  Widget build(BuildContext context) {
    final predictcontroler = Get.find<Predictcontroler>();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: AppColors.backgroundGradinet),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 40,
              bottom: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton.filled(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: AppColors.primaryColor,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.fourthColor,
                      ),
                    ),

                    Expanded(
                      child: Center(
                        child: Text(
                          'Riwayat',
                          style: TextStyle(
                            fontSize: 32,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 48),
                  ],
                ),
                Image.asset('assets/images/riwayat_flower.png', scale: 5),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  // TODO: Implementasi jumlah dinamis
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      gradient: AppColors.thirdGradient,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Obx(
                      () => Text(
                        '${predictcontroler.predictedTrashes.length} Sampah Terdeteksi',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                // GRID VIEW OF RYWAT BUTTONS
                SizedBox(height: 20),
                Expanded(
                  child: Obx(
                    () => GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.58,
                      ),
                      itemBuilder: (context, index) {
                        final trash = predictcontroler.predictedTrashes[index];
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: RiwayatButton(trash: trash),
                        );
                      },
                      itemCount: predictcontroler.predictedTrashes.length,
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
