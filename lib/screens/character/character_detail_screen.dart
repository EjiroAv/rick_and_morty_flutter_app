import 'package:flutter/material.dart';
import 'package:rick_and_morty_flutter_app/components/app_components.dart';
import 'package:rick_and_morty_flutter_app/models/character_model.dart';

class CharacterDetailScreen extends StatefulWidget {
  const CharacterDetailScreen({
    Key? key,
    required this.result,
  }) : super(key: key);

  final Result result;

  @override
  State<CharacterDetailScreen> createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  int selectedOption = 1;
  List<Widget> episodes = [];

  @override
  void initState() {
    super.initState();
    Result result = widget.result;
    for (String episode in result.episode) {
      String episodeNumber = episode.replaceAll(RegExp(r'[^0-9]'), '');

      episodes.add(EpisodesWidget(episode: episodeNumber));
    }
  }

  @override
  Widget build(BuildContext context) {
    Result result = widget.result;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 15.0,
                ),
                decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                ))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.indeterminate_check_box,
                      color: Colors.grey,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedOption = 1;
                        });
                      },
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Row(
                          children: [
                            selectedOption == 1
                                ? const SelectedOptionIndicator()
                                : const SizedBox(),
                            const Text('Characters'),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedOption = 2;
                        });
                      },
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Row(
                          children: [
                            selectedOption == 2
                                ? const SelectedOptionIndicator()
                                : const SizedBox(),
                            const Text('Locations'),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedOption = 3;
                        });
                      },
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Row(
                          children: [
                            selectedOption == 3
                                ? const SelectedOptionIndicator()
                                : const SizedBox(),
                            const Text('Episodes'),
                          ],
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
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
                      Material(
                        elevation: 2.5,
                        child: Container(
                          height: 250.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Image.network(result.image),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        result.name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        result.species!,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Text(
                            result.gender!,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            result.status!,
                            style: TextStyle(
                              color: result.status! == 'Alive'
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      DetailWidget(
                        title: 'Origin:',
                        detail: result.origin.name,
                      ),
                      result.type == ''
                          ? const SizedBox()
                          : DetailWidget(
                              title: 'Type/SubSpecies:',
                              detail: result.type!,
                            ),
                      DetailWidget(
                        title: "Last Know Location:",
                        detail: result.location.name,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Episode(s): ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Wrap(
                              spacing: 2,
                              runSpacing: 2,
                              children: episodes,
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
