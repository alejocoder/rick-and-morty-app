import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

class EpisodesCard extends StatefulWidget {
  final Episode episodes;
  const EpisodesCard({
    Key? key,
    required this.episodes,
  }) : super(key: key);

  @override
  State<EpisodesCard> createState() => _EpisodesCardState();
}

class _EpisodesCardState extends State<EpisodesCard> {
  late SharedPreferences prefs;
  bool isLiked = false;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedEpisodes = prefs.getStringList('likedEpisodes');
    if (likedEpisodes != null) {
      if (likedEpisodes.contains(widget.episodes.id.toString()) == true) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await prefs.setStringList('likedEpisodes', []);
    }
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  onHeartTap() async {
    final likedEpisodes = prefs.getStringList('likedEpisodes');
    if (likedEpisodes != null) {
      if (isLiked) {
        likedEpisodes.remove(widget.episodes.id.toString());
      } else {
        likedEpisodes.add(widget.episodes.id.toString());
      }
      await prefs.setStringList('likedEpisodes', likedEpisodes);
      setState(() {
        isLiked = !isLiked;
      });
    }
  }

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
                        widget.episodes.name,
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
                        'the episode air date is: ${widget.episodes.airDate}',
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
              widget.episodes.episode,
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
              widget.episodes.id.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            const SizedBox(
              height: 80,
            ),
            ElevatedButton.icon(
              onPressed: onHeartTap,
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_outline,
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
