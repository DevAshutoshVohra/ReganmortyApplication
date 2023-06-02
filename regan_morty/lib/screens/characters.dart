import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';




class CharacterScreen extends StatefulWidget {


  CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late String id;

  late String name;

  late String image;

  getHttp() async {
    try {
      final response =
          await Dio().get('https://rickandmortyapi.com/api/character/2');

//var jsonDe=response.data['name'];


      setState(() {
        name = response.data['name'];
        image=response.data['image'];
        id=response.data['id'].toString();
      });



     

    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    getHttp();

    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Column(
          children: [
            Text(name), 
            Text(id),
            Image.network(image),

          ],
        ),
      ),
    );
  }
}
