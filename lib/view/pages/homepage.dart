import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kairo/core/colors.dart';
import 'package:kairo/view/controllers/predictControler.dart';
import 'package:kairo/view/pages/riwayat.dart';
import 'package:kairo/view/pages/tipspage.dart';
import 'package:kairo/view/widgets/custom_homebutton.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final predictcontroler = Get.find<Predictcontroler>();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: AppColors.backgroundGradinet),
          ),
          Center(child: Image.asset('assets/images/home_flower.png')),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 40,
              bottom: 70,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ayo Tangani\nSampahmu',
                      style: TextStyle(
                        fontSize: 32,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50, top: 5),
                      child: Text(
                        'Tak perlu bingung lagi membuang sampah, scan dan dapatkan informasi lengkap tentang penanganan yang benar untuk kesehatan lingkungan.',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.primaryColor.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomHomebutton(
                      imagePath: 'assets/images/camera.png',
                      text: 'Kamera',
                      onTap: () async {
                        print('kamera touched');
                        await predictcontroler.predictImage(false);
                        if (predictcontroler.error.isNotEmpty) {
                          GetSnackBar(title: 'Error');
                        } else {
                          GetSnackBar(title: 'Success');
                          Get.to(Tipspage());
                        }
                      },
                    ),

                    CustomHomebutton(
                      imagePath: 'assets/images/gallery.png',
                      text: 'Galeri',
                      onTap: () async {
                        print('galeri touched');
                        await predictcontroler.predictImage(true);
                        if (predictcontroler.error.isNotEmpty) {
                          GetSnackBar(title: 'Error');
                        } else {
                          GetSnackBar(title: 'Success');
                          Get.to(Tipspage());
                        }
                      },
                    ),

                    CustomHomebutton(
                      imagePath: 'assets/images/history.png',
                      text: 'Riwayat',
                      onTap: () => Get.to(Riwayat()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
