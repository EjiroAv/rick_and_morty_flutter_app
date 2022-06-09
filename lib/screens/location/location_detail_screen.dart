import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_flutter_app/components/app_components.dart';
import 'package:rick_and_morty_flutter_app/models/character_model.dart'
    as characterModel;
import 'package:rick_and_morty_flutter_app/models/location_model.dart';
import 'package:http/http.dart' as http;

class LocationDetailScreen extends StatefulWidget {
  const LocationDetailScreen({
    Key? key,
    required this.result,
  }) : super(key: key);

  final Result result;

  @override
  State<LocationDetailScreen> createState() => _LocationDetailScreenState();
}

class _LocationDetailScreenState extends State<LocationDetailScreen> {
  int selectedOption = 1;
  List<Widget> residents = [];
  bool endOfList = false;
  int pageNumber = 1;

  bool loadingResidents = false;
  void getResidentInfo() async {
    setState(() {
      loadingResidents = true;
    });
    Result result = widget.result;

    while (endOfList == false) {
      final response = await http.Client().get(Uri.parse(
          'https://rickandmortyapi.com/api/character/?page=$pageNumber'));

      var characterResponse =
          characterModel.CharacterResponse.fromJson(json.decode(response.body));

      for (characterModel.Result characterResult in characterResponse.results) {
        String characterUrl = characterResult.url;
        // String residentNumber = resident.replaceAll(RegExp(r'[^0-9]'), '');

        if (result.residents.contains(characterUrl)) {
          residents.add(CharacterInfoWidget(
            result: characterResult,
            name: characterResult.name,
            imageURL: characterResult.image,
          ));
        }
      }

      if (pageNumber == characterResponse.info.pages) {
        endOfList = true;
      } else {
        pageNumber++;
      }
    }

    setState(() {
      loadingResidents = false;
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // executes after build
      getResidentInfo();
    });

    /* Result result = widget.result;
    for (String resident in result.residents) {
      String residentNumber = resident.replaceAll(RegExp(r'[^0-9]'), '');

      episodes.add(EpisodesWidget(episode: residentNumber));
    }*/
  }

  @override
  Widget build(BuildContext context) {
    Result result = widget.result;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Row(
            children: [
              const AppSideBar(selectedOption: 3),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppBackButton(),
                      const SizedBox(
                        height: 24.0,
                      ),
                      DetailWidget(
                        title: 'Name:',
                        detail: result.name,
                      ),
                      DetailWidget(
                        title: 'Type:',
                        detail: result.type,
                      ),
                      DetailWidget(
                        title: "Dimension:",
                        detail: result.dimension,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Residents: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          loadingResidents == true
                              ? Row(
                                  children: const [
                                    Text('Loading Residents'),
                                    CupertinoActivityIndicator(),
                                  ],
                                )
                              : residents.isEmpty == true
                                  ? const Text('No Residents')
                                  : SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: Wrap(
                                        spacing: 4,
                                        runSpacing: 5,
                                        children: residents,
                                      ),
                                    )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
