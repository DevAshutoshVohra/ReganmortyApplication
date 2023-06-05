import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:regan_morty/model/episode_card.dart';
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
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: episodeList.length,
            itemBuilder: (context, index) => EpisodeCard(
                name: episodeList[index].name,
                air_date: episodeList[index].air_date,
                episode: episodeList[index].episode),
          ),
        ),
      ],
    );
  }
}
