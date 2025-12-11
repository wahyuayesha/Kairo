import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:kairo/core/colors.dart';

class Riwayat extends StatelessWidget {
  const Riwayat({super.key});

  @override
  Widget build(BuildContext context) {
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
                    child: Text(
                      '5 Sampah Terdeteksi',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                // Row(
                //   children: [
                //     Expanded(child: RiwayatButton()),
                //     SizedBox(width: 10),
                //     Expanded(child: RiwayatButton()),
                //     SizedBox(width: 10),
                //     Expanded(child: RiwayatButton()),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
