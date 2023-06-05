import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:regan_morty/model/episodeds.dart';

class Episode extends StatefulWidget {
  const Episode({super.key});

  @override
  State<Episode> createState() => _EpisodeState();
}

class _EpisodeState extends State<Episode> {
  @override
  List<EpisodeDs> episodeList = [];

  String air_date = '';
  String name = '';
  String episode = '';

  void initState() {
    getResponse();

    super.initState();
  }

  void getResponse() async {
    Response response;

    try {
      response = await Dio().get('https://rickandmortyapi.com/api/episode/28');
      if (kDebugMode) {
        print('reques');
        print(response.data);
        print(response.data['id']);
        print(response.data['name']);
        print('Air Date ${response.data['air_date']}');
        print(' Episode : ${response.data['episode']} ');

        setState(() {
          name = response.data['name'];
          air_date = response.data['air_date'];
          episode = response.data['episode'];

          episodeList.clear();
          for (int i = 0; i < 20; i++) {
            episodeList.add(
                EpisodeDs(air_date: air_date, episode: episode, name: name));
          }
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

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
