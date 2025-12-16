// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryNames;
  final String? imagePath;
  const CategoryWidget({
    super.key,
    required this.categoryNames,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.09),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              borderRadius: BorderRadius.circular(24),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                imagePath ?? 'assets/images/tagamly_sozler001.png',
                width: 300,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(categoryNames),
            ),
          ],
        ),
      ),
    );
  }
}
