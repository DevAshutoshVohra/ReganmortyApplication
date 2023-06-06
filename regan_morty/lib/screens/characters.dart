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
  void initState() {
    super.initState();

    getCharacterData(1);
  }
bool isLoading=true;
  List<Character> characterlist = [];
  String id = '';

  String name = "";

  String image = '';

  void getCharacterData(int i) async {
    var onse;
    try {
      onse =
          await Dio().get('https://rickandmortyapi.com/api/character?page=$i');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }


    characterlist.clear();


    setState(() {

      for (int i = 0; i < 20; i++) {
        characterlist.add(
          Character(

            image: onse.data['results'][i]['image'],
            name: onse.data['results'][i]['name'],
            id: onse.data['results'][i]['id'].toString(),
          
          ),
          
        );
        isLoading=false;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return isLoading?Center(child: CircularProgressIndicator(),): Consumer<CharacterChangeNotifier>(
      builder: (context, obj, child) => Column(
          children: [
            Expanded(
              flex: 10,
              child: ListView.builder(
                itemCount: characterlist.length,
                itemBuilder: (context, index) => CharacterCard(
                  id: characterlist[index].id,
                  name: characterlist[index].name,
                  image: characterlist[index].image,
                ),
              ),
            ),
            // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     ElevatedButton(onPressed: null, child: Text('Previous'),),

            //     ElevatedButton(onPressed: null, child: Text('next'),),
            //   ],
            // )
            Expanded(
              flex:1 ,
              child: ListView.builder(
                itemCount: 42,
                itemBuilder: (context, index) => ElevatedButton(
                    onPressed: () => setState(() {
                          getCharacterData(index + 1);
                        }),
                    child: Text(index.toString())),
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      
    );
  }
}
