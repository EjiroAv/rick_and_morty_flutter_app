import 'package:flutter/material.dart';
import 'package:rick_and_morty_flutter_app/screens/screens.dart';
import 'app_components.dart';

import 'package:url_launcher/url_launcher.dart';

final Uri _rickAndMortyApi = Uri.parse('https://rickandmortyapi.com/');
final Uri _githubUrl =
    Uri.parse('https://github.com/EjiroAv/rick_and_morty_flutter_app');

class AppSideBar extends StatelessWidget {
  const AppSideBar({
    Key? key,
    required this.selectedOption,
  }) : super(key: key);

  final int selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          GestureDetector(
            onTap: () {
              _launchRickAndMortyApiUrl();
            },
            child: const SizedBox(
              width: 34.0,
              child: Text(
                'Rick and Morty',
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              /*   setState(() {
                selectedOption = 1;
              });*/
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        const CharacterScreen(),
                    transitionDuration: const Duration(seconds: 0),
                  ));
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
              /*  setState(() {
                selectedOption = 2;
              });*/
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        const LoactionScreen(),
                    transitionDuration: const Duration(seconds: 0),
                  ));
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
              /*   setState(() {
                selectedOption = 3;
              });*/
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        const EpisodeScreen(),
                    transitionDuration: const Duration(seconds: 0),
                  ));
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
          GestureDetector(
            onTap: () {
              _launchGithubUrl();
            },
            child: const SizedBox(
              height: 40.0,
              width: 30.0,
              child: Text(
                'GITHUB',
              ),
            ),
          )
        ],
      ),
    );
  }
}

void _launchRickAndMortyApiUrl() async {
  if (!await launchUrl(_rickAndMortyApi)) {
    throw 'Could not launch $_rickAndMortyApi';
  }
}

void _launchGithubUrl() async {
  if (!await launchUrl(_githubUrl)) throw 'Could not launch $_githubUrl';
}
