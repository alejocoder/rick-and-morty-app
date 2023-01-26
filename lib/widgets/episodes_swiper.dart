import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class EpisodesSwiper extends StatelessWidget {
  const EpisodesSwiper({super.key});

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
            itemCount: 10,
            layout: SwiperLayout.STACK,
            itemWidth: size.width * 1,
            itemHeight: size.height * 1,
            itemBuilder: (_, index) {
              return const EpisodesCard();
            },
          ),
        ),
      ],
    );
  }
}

class EpisodesCard extends StatelessWidget {
  const EpisodesCard({
    Key? key,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: AssetImage('assets/no-image.jpg'),
                    height: 400,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 220),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'name',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      Text(
                        'status',
                        style: TextStyle(fontSize: 20),
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
              children: const [
                Text(
                  'is a gender species',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'the type is type',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
            const Text(
              'Earth (Replacement Dimension)',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'the current location is:',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const Text(
              'Testicle Monster Dimension',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
