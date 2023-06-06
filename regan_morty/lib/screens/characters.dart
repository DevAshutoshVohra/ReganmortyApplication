import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:regan_morty/model/character.dart';
import 'package:regan_morty/model/character_card.dart';
import 'package:regan_morty/model/character_change_notifier.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  @override
  final controller = ScrollController();
  var i = 0;

  void initState() {
    super.initState();

    getCharacterData(i);
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        i++;

        getCharacterData(i);
      }
    });
  }

  bool isLoading = true;
  List<Character> characterlist = [];
  String id = '';

  String name = "";

  String image = '';

  void getCharacterData(int i) async {
    const limit=20;
    if (i > 42) {
      return;
    } else {
      var onse;
      try {
        onse = await Dio()
            .get('https://rickandmortyapi.com/api/character?_limit=$limit&page=$i');
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }

     // characterlist.clear();

      setState(
        () {
          for (int j = 0; j < 20; j++) {
            characterlist.add(
              Character(
                image: onse.data['results'][j]['image'],
                name: onse.data['results'][j]['name'],
                id: onse.data['results'][j]['id'].toString(),
              ),
            );

            isLoading = false;
          }
        },
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Consumer<CharacterChangeNotifier>(
            builder: (context, obj, child) => Column(
              children: [
                Expanded(
                  flex: 10,
                  child: ListView.builder(
                    controller: controller,
                    itemCount: characterlist.length + 1,
                    itemBuilder: (context, index) {
                      if (index < characterlist.length) {
                        return CharacterCard(
                          id: characterlist[index].id,
                          name: characterlist[index].name,
                          image: characterlist[index].image,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     ElevatedButton(onPressed: null, child: Text('Previous'),),

                //     ElevatedButton(onPressed: null, child: Text('next'),),
                //   ],
                // )
                // Expanded(
                //   flex:1 ,
                //   child: ListView.builder(
                //     itemCount: 42,
                //     itemBuilder: (context, index) => ElevatedButton(
                //         onPressed: () => setState(() {
                //               getCharacterData(index + 1);
                //             }),
                //         child: Text(index.toString())),
                //     scrollDirection: Axis.horizontal,
                //   ),
                // ),
              ],
            ),
          );
  }
}
