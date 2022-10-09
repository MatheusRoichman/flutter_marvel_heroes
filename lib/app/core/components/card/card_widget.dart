import 'package:flutter/material.dart';
import 'package:flutter_marvel_heroes/app/core/components/assets/image_asset.dart';

import '../../utils/constants.dart';
import '../typography/typography.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String subtitle;

  const CardWidget({required this.title, required this.imageUrl, required this.subtitle, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          ImageAsset(
            path: imageUrl,
            fit: BoxFit.cover,
            width: 140,
            height: 230,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 230,
              width: 140,
              decoration: const BoxDecoration(gradient: ThemeColors.gradientDark),
            ),
          ),
          Positioned(
            width: 125,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subtitle,
                    style: TTypography.cardSubtitle.merge(TextStyle(
                      color: ThemeColors.primaryWhite.withOpacity(0.75),
                    )),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    title,
                    style: TTypography.cardTitle.merge(const TextStyle(
                      color: ThemeColors.primaryWhite,
                    )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
