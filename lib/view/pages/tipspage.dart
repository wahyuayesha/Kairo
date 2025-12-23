import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kairo/core/colors.dart';
import 'package:kairo/core/functions/class_text_separator.dart';
import 'package:kairo/domain/entities/trashEntity.dart';
import 'package:kairo/view/controllers/predictControler.dart';
import 'package:kairo/view/controllers/wasteInfoController.dart';

class Tipspage extends StatelessWidget {
  Tipspage({super.key, required this.predictedTrash});
  final predictController = Get.find<Predictcontroler>();
  final wasteInfoController = Get.find<Wasteinfocontroller>();
  final TrashEntity predictedTrash;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton.filled(
        onPressed: () => Get.back(),
        icon: Icon(Icons.arrow_back_ios_rounded, color: AppColors.primaryColor),
        style: IconButton.styleFrom(backgroundColor: AppColors.fourthColor),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: AppColors.backgroundGradinet),
          ),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 40,
                bottom: 20,
              ),
              child: Obx(() {
                if (predictController.isloading.value) {
                  return Center(child: Text('loading'));
                }

                if (predictedTrash.image == '') {
                  return Center(child: Text('Tidak Ada Data'));
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gambar
                    Image.file(File(predictedTrash.image)),

                    // List item
                    ListView.builder(
                      itemCount: predictedTrash.className.length,
                      shrinkWrap: true, // WAJIB kalau inside scroll
                      physics:
                          NeverScrollableScrollPhysics(), // biar tidak konflik
                      itemBuilder: (context, index) {
                        final parts = classTextSeparator(
                          predictedTrash.className[index],
                        );

                        final wasteValue = parts[0];
                        final waste = parts[1];

                        final wasteInfo = wasteInfoController
                            .getWasteInfoByName(waste);

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              color: Colors.black12,
                              thickness: 2,
                              height: 40,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                waste,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                wasteValue,
                                style: TextStyle(color: AppColors.fourthColor),
                              ),
                            ),
                            const SizedBox(height: 12),
                            if (wasteInfo != null) ...[
                              Container(
                                padding: EdgeInsets.all(10),
                                width: double.infinity,
                                // height: 30,
                                decoration: BoxDecoration(
                                  color: AppColors.thirdColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    wasteInfo.definition,
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),
                              Container(
                                width: double.infinity,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: AppColors.thirdColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Penanganan:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              for (var management in wasteInfo.managements)
                                Text(
                                  '- $management',
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                  ),
                                ),

                              SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: AppColors.thirdColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Tempat Pengumpulan:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              for (var tempat in wasteInfo.collectionSites)
                                Text(
                                  '- $tempat',
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                  ),
                                ),

                              SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: AppColors.thirdColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Daur Ulang:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              for (var recycle in wasteInfo.recycles)
                                Text(
                                  '- $recycle',
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              SizedBox(height: 50),
                            ] else ...[
                              Text('No additional information available.'),
                            ],
                          ],
                        );
                      },
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
