import 'package:flutter/material.dart';
import 'package:kairo/core/colors.dart';

class RiwayatButton extends StatelessWidget {
  const RiwayatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Image.asset(
              'assets/images/barang_test.jpg',
              width: double.infinity,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Judul',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Deskripsi',
            style: TextStyle(color: AppColors.primaryColor, fontSize: 10),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Deskripsi',
              style: TextStyle(color: AppColors.primaryColor, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
