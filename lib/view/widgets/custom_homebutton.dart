import 'package:flutter/material.dart';
import 'package:kairo/core/colors.dart';

class CustomHomebutton extends StatelessWidget {
  const CustomHomebutton({
    super.key,
    required this.imagePath,
    required this.text,
    required this.onTap,
  });

  final String imagePath;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(child: Image.asset(imagePath)),
          ),
        ),
        SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(color: AppColors.primaryColor, fontSize: 15),
        ),
      ],
    );
  }
}
