import 'package:flutter/material.dart';
import 'package:rnly/app/shared/shared.dart';

class DashboardItem extends StatelessWidget {
  final String mainText;
  final IconData? icon;
  final String? subText;
  final Color? color;
  final VoidCallback onTap;
  const DashboardItem({
    Key? key,
    required this.mainText,
    this.icon,
    this.subText,
    this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        height: 165,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: color ?? baseColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: white,
              size: 26,
            ),
            const SizedBox(height: 5),
            Text(
              mainText,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              subText ?? '',
            )
          ],
        ),
      ),
    );
  }
}
