import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_tecnico_rick_morty/providers/API_provider.dart';
import 'package:test_tecnico_rick_morty/providers/bottom_nav_provider.dart';
import 'package:test_tecnico_rick_morty/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BottomNavProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ApiProvider(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rick and Morty App',
        initialRoute: "home",
        routes: {
          'home': (_) => const HomeScreen(),
          'characters': (_) => const CharacterScreen(),
          'episodes': (_) => const EpisodesScreen(),
          'locations': (_) => const LocationsScreen(),
        },
        theme: ThemeData.dark(),
      ),
    );
  }
}
