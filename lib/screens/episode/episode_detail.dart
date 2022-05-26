import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_flutter_app/components/app_components.dart';
import 'package:rick_and_morty_flutter_app/models/character_model.dart'
    as characterModel;
import 'package:rick_and_morty_flutter_app/models/episode_model.dart';
import 'package:http/http.dart' as http;

class EpisodeDetailScreen extends StatefulWidget {
  const EpisodeDetailScreen({
    Key? key,
    required this.result,
  }) : super(key: key);

  final Result result;

  @override
  State<EpisodeDetailScreen> createState() => _EpisodeDetailScreenState();
}

class _EpisodeDetailScreenState extends State<EpisodeDetailScreen> {
  int selectedOption = 1;
  List<Widget> characters = [];
  bool endOfList = false;
  int pageNumber = 1;

  bool loadingCharacters = false;
  void getCharacterInfo() async {
    setState(() {
      loadingCharacters = true;
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

        if (result.characters.contains(characterUrl)) {
          characters.add(CharacterInfoWidget(
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
      loadingCharacters = false;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // executes after build
      getCharacterInfo();
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
                        title: 'Title:',
                        detail: result.name,
                      ),
                      DetailWidget(
                        title: 'Episode:',
                        detail: result.episode,
                      ),
                      DetailWidget(
                        title: "Airdate:",
                        detail: result.airDate,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Characters: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          loadingCharacters == true
                              ? Row(
                                  children: const [
                                    Text('Loading Characters'),
                                    CupertinoActivityIndicator(),
                                  ],
                                )
                              : characters.isEmpty == true
                                  ? const Text('No Characters')
                                  : SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: Wrap(
                                        spacing: 4,
                                        runSpacing: 5,
                                        children: characters,
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
