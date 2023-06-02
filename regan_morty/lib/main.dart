import 'package:flutter/material.dart';
import 'package:regan_morty/model/character_change_notifier.dart';
import 'package:regan_morty/screens/characters.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => CharacterChangeNotifier(),
      )
    ], child: const MaterialApp(home: CharacterScreen()));
  }
}
