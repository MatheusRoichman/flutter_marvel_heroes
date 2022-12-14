import 'package:flutter/material.dart';
import 'package:flutter_marvel_heroes/app/core/components/assets/image_asset.dart';

import '../../utils/constants.dart';
import '../typography/typography.dart';

class CardWidget extends StatelessWidget {
  final String? title;
  final String imageUrl;
  final String? subtitle;
  final VoidCallback? onTap;
  final LinearGradient? gradient;
  final double? width;
  final double? height;

  const CardWidget({
    this.title,
    required this.imageUrl,
    this.subtitle,
    this.onTap,
    this.gradient,
    this.width,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            ImageAsset(
              path: imageUrl,
              fit: BoxFit.cover,
              width: width,
              height: height,
            ),
            Positioned(
              width: width,
              height: height,
              bottom: 0,
              child: Container(
                height: height,
                decoration: BoxDecoration(gradient: gradient),
              ),
            ),
            Positioned(
              width: width != null ? width! - 15 : null,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: TTypography.cardSubtitle.merge(TextStyle(
                          color: ThemeColors.primaryWhite.withOpacity(0.75),
                        )),
                      ),
                    const SizedBox(height: 2),
                    if (title != null)
                      Text(
                        title!,
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
      ),
    );
  }
}
