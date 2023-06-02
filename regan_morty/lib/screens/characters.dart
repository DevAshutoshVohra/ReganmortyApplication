import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

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

    // TODO: implement initState
    super.initState();
    getHttp();
  }
   String id='';

   String name = "";

   String image='';

  getHttp() async {
    try {

      Response response =
          await Dio().get('https://rickandmortyapi.com/api/character/2');

      final res = await Dio().get('https://rickandmortyapi.com/api/character');


      
      // if (kDebugMode) {
      //   print(response);
      // }

      // var jsonData=jsonDecode(response.data) as Map<String , dynamic>;

        // final d=jsonDecode(response.data).cast<Map<String, dynamic>>();



       
       
       
       
       
       
       
      //  print(response.data);

      //  print(response.data['name']);
      // setState(() {
      //   name = response.data['name'];
      // });

        // Map<String,dynamic>map=jsonDecode(response.data);
         // List<dynamic> data = jsonDecode(response.data);
        //print(jsonData.toString());


      setState(() {
        name = response.data['name'];
        image = response.data['image'];
        id = response.data['id'].toString();
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    

    return Consumer<CharacterChangeNotifier>(
      builder:(context,obj,child)=> Scaffold(
        appBar: AppBar(),
        body:ListView(children: [CharacterCard(id: id,name: name,image: image,)],)
       
      ),
    );
  }
}
