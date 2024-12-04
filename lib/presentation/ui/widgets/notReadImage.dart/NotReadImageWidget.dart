import 'package:flutter/material.dart';

class NotReadImageWidget extends StatelessWidget {
  final double? height;
  const NotReadImageWidget({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
      child: Image.asset(
        'assets/cat/cat_not_found.png',
        height: height ?? 250,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}
