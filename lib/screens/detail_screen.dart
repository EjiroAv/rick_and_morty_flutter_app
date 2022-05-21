import 'package:flutter/material.dart';
import 'package:rick_and_morty_flutter_app/components/app_components.dart';

class CharacterDetailScreen extends StatefulWidget {
  const CharacterDetailScreen({Key? key}) : super(key: key);

  @override
  State<CharacterDetailScreen> createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
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
                      Row(
                        children: const [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.grey,
                            size: 15.0,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text('Back'),
                        ],
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Material(
                        elevation: 2.5,
                        child: Container(
                          height: 250.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Image.network(
                              'https://rickandmortyapi.com/api/character/avatar/1.jpeg'),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        'Rick Sanchez',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const Text(
                        'Human',
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: const [
                          Text(
                            'Male',
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Alive',
                            style: TextStyle(color: Colors.green
                                // status == 'Alive' ? Colors.green : Colors.red,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Origin: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text('Earth (C-137)'),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Type/SubSpecies: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text('Null'),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Last Know Location: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Earth (Replacement Dimension)',
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Episodes: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: const [
                              EpisodesWidget(
                                episode: '1',
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              EpisodesWidget(
                                episode: '2',
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              EpisodesWidget(
                                episode: '3',
                              )
                            ],
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

class EpisodesWidget extends StatelessWidget {
  const EpisodesWidget({
    Key? key,
    required this.episode,
  }) : super(key: key);

  final String episode;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: 60.0,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
          child: Text(
        episode,
        style: const TextStyle(color: Colors.white),
      )),
    );
  }
}
