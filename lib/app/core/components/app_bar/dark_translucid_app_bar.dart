import 'package:flutter/material.dart';
import 'package:flutter_marvel_heroes/app/core/components/assets/svg_asset.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../utils/constants.dart';

class DarkTranslucidAppBar extends AppBar {
  DarkTranslucidAppBar({Key? key})
      : super(
          key: key,
          elevation: 0,
          toolbarHeight: 64,
          backgroundColor: ThemeColors.primaryBlack.withOpacity(0.5),
          leading: GestureDetector(
            onTap: () => Modular.to.pop(),
            child: Container(
              margin: const EdgeInsets.only(left: 24),
              child: const SvgAsset(
                path: '${Assets.icons}/back.svg',
                width: 20,
                height: 12.48,
                color: ThemeColors.primaryWhite,
              ),
            ),
          ),
        );
}
