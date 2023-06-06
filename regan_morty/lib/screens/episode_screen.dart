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
  final controller = ScrollController();

  List<EpisodeDs> episodeList = [];
  bool isLoading = true;
  String air_date = '';
  String name = '';
  String episode = '';
  int i = 1;
  void initState() {

    getResponse(i);

      controller.addListener(() {
        if(controller.position.maxScrollExtent==controller.offset){
          if(kDebugMode){
            print(controller.offset);

          }

          i++;
          getResponse(i);
        }
      });

    super.initState();
  }
  void dispose(){
    controller.dispose();
    super.dispose();
  }


  void getResponse(int i) async {
    if(i>3)return;

    Response response;

    try {
      response =
          await Dio().get('https://rickandmortyapi.com/api/episode?page=$i');
      if (kDebugMode) {
        setState(() {
          isLoading = false;
          //episodeList.clear();
          for (int i = 0; i < 20; i++) {
            name = response.data['results'][i]['name'];
            air_date = response.data['results'][i]['air_date'];
            episode = response.data['results'][i]['episode'];
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
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              Expanded(
                flex: 10,
                child: ListView.builder(
                    controller: controller,
                    itemCount: episodeList.length + 1,
                    itemBuilder: (context, index) {
                      if (index < episodeList.length) {
                        return EpisodeCard(
                            name: episodeList[index].name,
                            air_date: episodeList[index].air_date,
                            episode: episodeList[index].episode);
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            ],
          );
  }
}
