import 'package:flutter/material.dart';
import 'package:flutter_marvel_heroes/app/core/components/typography/typography.dart';

import '../../../core/utils/constants.dart';

class CaracteristicCard extends StatelessWidget {
  final Widget icon;
  final String text;

  const CaracteristicCard({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 48,
      child: Column(
        children: [
          icon,
          const SizedBox(height: 12),
          Text(
            text,
            style: TTypography.caracteristic.merge(const TextStyle(color: ThemeColors.primaryWhite)),
          ),
        ],
      ),
    );
  }
}
