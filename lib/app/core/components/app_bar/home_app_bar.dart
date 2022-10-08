import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../assets/svg_asset.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({Key? key})
      : super(
          key: key,
          elevation: 0,
          toolbarHeight: 64,
          backgroundColor: ThemeColors.primarySilver,
          titleTextStyle: const TextStyle(
            fontFamily: Fonts.graphie,
            color: ThemeColors.primaryBlack,
            fontSize: 20,
          ),
          title: const Center(
            child: SvgAsset(
              path: '${Assets.icons}/marvel_logo.svg',
              width: 70,
              height: 25,
              color: ThemeColors.primaryRed,
            ),
          ),
        );
}