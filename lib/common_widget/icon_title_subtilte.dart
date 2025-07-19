import 'package:flutter/material.dart';

class IconTitleSubtile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback onPressed;
  const IconTitleSubtile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Expanded(
        child: Column(
          children: [
            Image.asset(imagePath, width: 50, height: 50),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 8),
             Text(
              subtitle,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
