import 'package:flutter/material.dart';
import 'package:rick_and_morty_flutter_app/components/app_components.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 15.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Characters',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                    children: const [
                      CharacterWidget(
                        imageURL:
                            'https://rickandmortyapi.com/api/character/avatar/183.jpeg',
                        name: 'Rick Sanchez',
                        species: 'Human',
                        gender: 'Male',
                        status: 'Alive',
                      ),
                      CharacterWidget(
                        imageURL:
                            'https://rickandmortyapi.com/api/character/avatar/183.jpeg',
                        name: 'Rick Sanchez',
                        species: 'Human',
                        gender: 'Male',
                        status: 'Alive',
                      ),
                      CharacterWidget(
                        imageURL:
                            'https://rickandmortyapi.com/api/character/avatar/183.jpeg',
                        name: 'Rick Sanchez',
                        species: 'Human',
                        gender: 'Male',
                        status: 'Alive',
                      ),
                      CharacterWidget(
                        imageURL:
                            'https://rickandmortyapi.com/api/character/avatar/183.jpeg',
                        name: 'Rick Sanchez',
                        species: 'Human',
                        gender: 'Male',
                        status: 'Alive',
                      ),
                      CharacterWidget(
                        imageURL:
                            'https://rickandmortyapi.com/api/character/avatar/183.jpeg',
                        name: 'Rick Sanchez',
                        species: 'Human',
                        gender: 'Male',
                        status: 'Alive',
                      ),
                      CharacterWidget(
                        imageURL:
                            'https://rickandmortyapi.com/api/character/avatar/183.jpeg',
                        name: 'Rick Sanchez',
                        species: 'Human',
                        gender: 'Male',
                        status: 'Alive',
                      ),
                    ],
                  )),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
