import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_tecnico_rick_morty/models/characters_response.dart';

class CharacterSwiper extends StatelessWidget {
  final List<Character> characters;
  const CharacterSwiper({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.85,
          child: Swiper(
            itemCount: characters.length,
            layout: SwiperLayout.STACK,
            itemWidth: size.width * 1,
            itemHeight: size.height * 1,
            itemBuilder: (_, index) {
              final character = characters[index];
              return CharacterCard(
                characters: character,
              );
            },
          ),
        ),
      ],
    );
  }
}

class CharacterCard extends StatefulWidget {
  final Character characters;

  const CharacterCard({
    Key? key,
    required this.characters,
  }) : super(key: key);

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  late SharedPreferences prefs;
  bool isLiked = false;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedCharacters = prefs.getStringList('likedCharacters');
    if (likedCharacters != null) {
      if (likedCharacters.contains(widget.characters.id.toString()) == true) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await prefs.setStringList('likedCharacters', []);
    }
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  onHeartTap() async {
    final likedCharacters = prefs.getStringList('likedCharacters');
    if (likedCharacters != null) {
      if (isLiked) {
        likedCharacters.remove(widget.characters.id.toString());
      } else {
        likedCharacters.add(widget.characters.id.toString());
      }
      await prefs.setStringList('likedCharacters', likedCharacters);
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(widget.characters.image),
                    height: 300,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 180),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.characters.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                      Text(
                        widget.characters.status.name,
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
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'is a ${widget.characters.gender.name} ${widget.characters.species.name}',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'the type is ${(widget.characters.type.length > 2) ? widget.characters.type : 'not specified'}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'the origin location is:',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              widget.characters.origin.name,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'the current location is:',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              widget.characters.location.name,
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
