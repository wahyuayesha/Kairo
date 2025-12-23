import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kairo/core/colors.dart';
import 'package:kairo/core/functions/class_text_separator.dart';
import 'package:kairo/domain/entities/trashEntity.dart';
import 'package:kairo/view/pages/riwayat.dart';
import 'package:kairo/view/pages/tipspage.dart';

class RiwayatButton extends StatelessWidget {
  const RiwayatButton({super.key, required this.trash});
  final TrashEntity trash;

  @override
  Widget build(BuildContext context) {
    final parts = classTextSeparator(trash.className[0]);
    return GestureDetector(
      onTap: ()=> Get.to(Tipspage(predictedTrash: trash,)),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: AppColors.tintGradient,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.file(
                File(trash.image),
                width: double.infinity,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              parts[1],
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              parts[0],
              style: TextStyle(color: AppColors.primaryColor, fontSize: 10),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                trash.createdAt != null ? trash.createdAt! : '',
                style: TextStyle(color: AppColors.primaryColor, fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
