import 'package:flutter/material.dart';
import 'package:rick_and_morty_flutter_app/screens/screens.dart';
import 'app_components.dart';

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
          const Icon(
            Icons.indeterminate_check_box,
            color: Colors.grey,
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
          const Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
