import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:regan_morty/model/locationds.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  List<Locationds> locations = [];
  String id = '';
  String name = '';
  String type = '';
  String dimension = '';
  String residentNumber = '';

  @override
  void getLocation() async {
    var response;
    try {
      response = await Dio().get('https://rickandmortyapi.com/api/location/3');
      print(response.data);
      // print(response.data['id']);
    } catch (e) {
      print(e);
    }
    locations.clear();

    setState(() {
      for(int i=0;i<20;i++){
            id = response.data['id'].toString();
      name = response.data['name'];
      type = response.data['type'];
      residentNumber = response.data['residents'].length.toString();
      dimension = response.data['dimension'];

      locations.add(Locationds(id: id, dimension: dimension, name: name, residentNumber: residentNumber, type: type));
   
      }
   });
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          //rgb(64,64,64)
          //rgb(67,66,64)
          color: Colors.grey,
          gradient: LinearGradient(colors: [Colors.black26, Colors.blue])),
      child: Column(
        children: [
          Text(
            'id : $id',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontStyle: FontStyle.italic),
          ),
          Text(
            'Name : $name',
            style: TextStyle(
                color: Color.fromARGB(255, 83, 18, 224),
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontStyle: FontStyle.italic),
          ),
          Text(
            'Type : $type',
            style: TextStyle(
                color: Color.fromARGB(255, 83, 18, 224),
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontStyle: FontStyle.italic),
          ),
          Text(
            "dimension: $dimension",
            style: TextStyle(
                color: Color.fromARGB(255, 83, 18, 224),
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontStyle: FontStyle.italic),
          ),
          Text(
            'Number of Residents : $residentNumber',
            style: TextStyle(
                color: Color.fromARGB(255, 83, 18, 224),
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontStyle: FontStyle.italic),
          )
        ],
      ),
    );
  }
}
