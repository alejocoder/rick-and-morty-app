import 'package:flutter/material.dart';
import 'package:test_tecnico_rick_morty/widgets/widgets.dart';

class EpisodesScreen extends StatelessWidget {
  const EpisodesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: EpisodesSwiper(),
    );
  }
}
