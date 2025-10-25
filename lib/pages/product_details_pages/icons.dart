// icons.dart
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color colorData;

  CustomIconButton({
    required this.icon,
    required this.onTap,
    required this.colorData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Icon(icon, color: colorData, size: 30),
      ),
    );
  }
}
