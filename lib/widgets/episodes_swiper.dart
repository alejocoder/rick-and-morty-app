import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:test_tecnico_rick_morty/models/episodes_response.dart';

class EpisodesSwiper extends StatelessWidget {
  final List<Episode> episodes;
  const EpisodesSwiper({super.key, required this.episodes});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.6,
          child: Swiper(
            itemCount: episodes.length,
            layout: SwiperLayout.STACK,
            itemWidth: size.width * 1,
            itemHeight: size.height * 1,
            itemBuilder: (_, index) {
              final episode = episodes[index];
              return EpisodesCard(episodes: episode);
            },
          ),
        ),
      ],
    );
  }
}

class EpisodesCard extends StatelessWidget {
  final Episode episodes;
  const EpisodesCard({
    Key? key,
    required this.episodes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 450),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        episodes.name,
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'the episode air date is: ${episodes.airDate}',
                        style: const TextStyle(fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            const Text(
              'the episode code is:',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              episodes.episode,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'the episode id is:',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              episodes.id.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            const SizedBox(
              height: 80,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                size: 45,
              ),
              label: const Text(
                'add to favorites',
                style: TextStyle(fontSize: 30),
              ),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
                overlayColor: MaterialStatePropertyAll<Color>(Colors.grey),
                padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                fixedSize: MaterialStatePropertyAll(Size(400, 80)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
