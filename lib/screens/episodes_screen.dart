import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_tecnico_rick_morty/providers/API_provider.dart';
import 'package:test_tecnico_rick_morty/widgets/widgets.dart';

class EpisodesScreen extends StatelessWidget {
  const EpisodesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final episodesProvider = Provider.of<ApiProvider>(context);
    return Center(
      child: EpisodesSwiper(episodes: episodesProvider.episodes,),
    );
  }
}
