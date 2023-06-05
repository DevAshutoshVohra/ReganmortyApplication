import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regan_morty/model/character_change_notifier.dart';

// ignore: must_be_immutable
class CharacterCard extends StatefulWidget {
  CharacterCard(
      {super.key, required this.id, required this.name, required this.image});

  String name;
  String id;
  String image;

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  @override
 

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterChangeNotifier>(
      builder: (context, obj, child) => Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(197, 237, 240, 243),
            Color.fromARGB(199, 215, 139, 8)
              // , Color.fromARGB(6, 67, 66, 64)
          ]),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          //rgb(64,64,64)
          //rgb(67,66,64)
          color: Colors.grey,
        ),
        child: Column(
          children: [
            Text(widget.name),
            Text(widget.id),
            if (widget.image.isNotEmpty) Image.network(widget.image),
          ],
        ),
      ),
    );
  }
}
