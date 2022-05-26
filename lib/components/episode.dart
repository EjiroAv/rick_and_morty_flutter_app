import 'package:flutter/material.dart';

class Episodes extends StatelessWidget {
  const Episodes({
    Key? key,
    required this.episode,
    required this.name,
  }) : super(key: key);

  final String name;
  final String episode;
  @override
  Widget build(BuildContext context) {
    int episodeNumber = int.parse(episode.replaceAll(RegExp(r'[^0-9]'), ''));
    Color containerColor;

    if (episodeNumber >= 100 && episodeNumber < 200) {
      containerColor = const Color(0xff44281D);
    } else if (episodeNumber >= 200 && episodeNumber < 300) {
      containerColor = const Color(0xffE4A788);
    } else if (episodeNumber >= 300 && episodeNumber < 400) {
      containerColor = const Color(0xffF0E14A);
    } else if (episodeNumber >= 400 && episodeNumber < 500) {
      containerColor = const Color(0xff97CE4C);
    } else {
      containerColor = const Color(0xffE89AC7);
    }
    const whiteTextStyle = TextStyle(color: Colors.white);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            height: 100.0,
            padding: const EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Colors.black),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  episode,
                  textAlign: TextAlign.center,
                  style: containerColor == const Color(0xff44281D)
                      ? whiteTextStyle
                      : null,
                ),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: containerColor == const Color(0xff44281D)
                      ? whiteTextStyle
                      : null,
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        )
      ],
    );
  }
}
