import 'package:flutter/material.dart';

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
