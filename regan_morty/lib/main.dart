import 'package:flutter/material.dart';
import 'package:regan_morty/model/character_change_notifier.dart';
import 'package:regan_morty/screens/characters.dart';
import 'package:provider/provider.dart';
import 'package:regan_morty/screens/episode_screen.dart';
import 'package:regan_morty/screens/location.dart';

void main(List<String> args) {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  List<Widget> screens = const [CharacterScreen(), Location(), Episode()];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CharacterChangeNotifier(),
        )
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Rick And Morty'),
          ),
          bottomNavigationBar: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.face), label: 'Character'),
              NavigationDestination(icon: Icon(Icons.map), label: 'Location'),
              NavigationDestination(icon: Icon(Icons.tv), label: 'Episode')
            ],
            animationDuration: const Duration(seconds: 8),
            selectedIndex: index,
            onDestinationSelected: (index) => setState(
              () {
                this.index = index;
              },
            ),
          ),
          body: screens[index],
        ),
      ),
    );
  }
}
