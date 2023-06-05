import 'package:flutter/material.dart';
class EpisodeCard extends StatelessWidget {
  const EpisodeCard({super.key , required this.name ,  required this.air_date , required this.episode});

   final String name;
 final  String air_date;
 final  String episode;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          //rgb(64,64,64)
          //rgb(67,66,64)
          color: Colors.grey,
          gradient: LinearGradient(colors: [
            Color.fromARGB(66, 108, 123, 106),
            Color.fromARGB(255, 10, 52, 2)
          ])),
      child: Column(
        children: [
          Text(
            'Name : $name ',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontStyle: FontStyle.italic),
          ),
          Text(
            'Air Date : $air_date ',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontStyle: FontStyle.italic),
          ),
          Text(
            " Episode : $episode ",
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}