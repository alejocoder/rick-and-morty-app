import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_tecnico_rick_morty/providers/API_provider.dart';
import 'package:test_tecnico_rick_morty/widgets/character_swiper.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final characterProvider = Provider.of<ApiProvider>(context);

    return Center(
      child: CharacterSwiper( characters: characterProvider.characters),
    );
  }
}
