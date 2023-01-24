import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_tecnico_rick_morty/providers/bottom_nav_provider.dart';
import 'package:test_tecnico_rick_morty/screens/screens.dart';
import 'package:test_tecnico_rick_morty/widgets/custom_navigatorbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('rick and morty'),
        elevation: 1,
      ),
      body: _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final navProvider = Provider.of<BottomNavProvider>(context);

    final currentIndex = navProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return CharacterScreen();

      case 1:
        return EpisodesScreen();

      case 2:
        return LocationsScreen();

      default:
        return CharacterScreen();
    }
  }
}
