import 'package:flutter/material.dart';
import 'package:flutter_marvel_heroes/app/core/components/assets/svg_asset.dart';

import '../../../core/utils/constants.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  final void Function(int) onTap;
  final int selectedIndex;

  const HomeBottomNavigationBar({super.key, required this.onTap, required this.selectedIndex});

  @override
  State<HomeBottomNavigationBar> createState() => _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  final List<BottomNavigationBarItem> _items = [
    const BottomNavigationBarItem(
      icon: SvgAsset(
        path: '${Assets.icons}/hero.svg',
        color: ThemeColors.primaryGrey,
      ),
      activeIcon: SvgAsset(
        path: '${Assets.icons}/hero.svg',
        color: ThemeColors.primaryRed,
      ),
      label: 'Personagens',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.movie, color: ThemeColors.primaryGrey),
      activeIcon: Icon(Icons.movie, color: ThemeColors.primaryRed),
      label: 'Filmes',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _items,
      selectedItemColor: ThemeColors.primaryRed,
      currentIndex: widget.selectedIndex,
      onTap: widget.onTap,
    );
  }
}
