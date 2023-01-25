import 'package:flutter/material.dart';
import 'package:test_tecnico_rick_morty/widgets/card_swiper.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CardSwiper(),
    );
  }
}
