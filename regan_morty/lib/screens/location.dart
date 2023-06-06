import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:regan_morty/model/location_card.dart';
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
    getLocation(1);
    super.initState();
  }

  List<Locationds> locations = [];
  bool isLoading = true;
  String id = '';
  String name = '';
  String type = '';
  String dimension = '';
  String residentNumber = '';

  void getLocation(int index) async {
    var response;
    try {
      response = await Dio()
          .get('https://rickandmortyapi.com/api/location?page=$index');
      // print(response.data);
      // print(response.data['results'][0]);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    locations.clear();

    setState(() {

      for (int i = 0; i < 20; i++) {
        id = response.data['results'][i]['id'].toString();
        name = response.data['results'][i]['name'];
        type = response.data['results'][i]['type'];
        isLoading=false;
        residentNumber =
            response.data['results'][i]['residents'].length.toString();
        dimension = response.data['results'][i]['dimension'];

        locations.add(Locationds(
            id: id,
            dimension: dimension,
            name: name,
            residentNumber: residentNumber,
            type: type));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator(),)
        : Column(
            children: [
              Expanded(
                flex: 10,
                child: ListView.builder(
                  itemCount: locations.length,
                  itemBuilder: (context, index) => LocationCard(
                      id: locations[index].id,
                      dimension: locations[index].dimension,
                      name: locations[index].name,
                      residentNumber: locations[index].name,
                      type: locations[index].type),
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) => ElevatedButton(
                    onPressed: () => getLocation(index + 1),
                    child: Text(
                      index.toString(),
                    ),
                  ),
                ),
              )
            ],
          );
  }
}
