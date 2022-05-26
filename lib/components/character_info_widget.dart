import 'package:flutter/material.dart';
import 'package:rick_and_morty_flutter_app/models/character_model.dart';
import 'package:rick_and_morty_flutter_app/screens/screens.dart';

class CharacterInfoWidget extends StatelessWidget {
  const CharacterInfoWidget(
      {Key? key,
      required this.imageURL,
      required this.name,
      required this.result})
      : super(key: key);

  final String imageURL;
  final String name;
  final Result result;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  CharacterDetailScreen(result: result),
              transitionDuration: const Duration(seconds: 0),
            ));
      },
      child: Column(
        children: [
          Container(
            height: 100.0,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
            child: Image.network(imageURL),
          ),
          Text(
            name,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
