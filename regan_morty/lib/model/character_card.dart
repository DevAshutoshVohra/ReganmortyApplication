import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regan_morty/model/character_change_notifier.dart';

class CharacterCard extends StatelessWidget {
  CharacterCard(
      {super.key, required this.id, required this.name, required this.image});

  String name;
  String id;
  String image;

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterChangeNotifier>(
      builder: (context, obj, child) => Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.grey,
        ),
        child: Column(
          children: [
            Text(name),
            Text(id),
            if (image.isNotEmpty) Image.network(image),
          ],
        ),
      ),
    );
  }
}