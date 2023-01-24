import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bottom_nav_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<BottomNavProvider>(context);

    final currentIndex = navProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (int i) => navProvider.selectedMenuOpt = i,
      currentIndex: currentIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person_add_outlined),
          label: 'characters',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_arrow_outlined),
          label: 'episodes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map_outlined),
          label: 'locations',
        ),
      ],
    );
  }
}
