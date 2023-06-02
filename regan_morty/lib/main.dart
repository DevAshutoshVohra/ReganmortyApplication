import 'package:flutter/material.dart';
import 'package:regan_morty/screens/characters.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: CharacterScreen());
  }
}
