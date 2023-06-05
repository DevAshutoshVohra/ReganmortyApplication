import 'package:flutter/material.dart';
// ignore: must_be_immutable
class LocationCard extends StatelessWidget {
   LocationCard({super.key , required this.id , required this.dimension , required this.name , required this.residentNumber , required this.type});
  String id;
  String name;
  String type;
  String dimension;
  String residentNumber;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const  EdgeInsets.all(20),
      padding:const  EdgeInsets.all(20),
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
            style:  const  TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontStyle: FontStyle.italic),
          ),
          Text(
            'Name : $name',
            style: const  TextStyle(
                color: Color.fromARGB(255, 83, 18, 224),
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontStyle: FontStyle.italic),
          ),
          Text(
            'Type : $type',
            style:const TextStyle(
                color: Color.fromARGB(255, 83, 18, 224),
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontStyle: FontStyle.italic),
          ),
          Text(
            "dimension: $dimension",
            style: const TextStyle(
                color: Color.fromARGB(255, 83, 18, 224),
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontStyle: FontStyle.italic),
          ),
          Text(
            'Number of Residents : $residentNumber',
            style:const  TextStyle(
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