import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_flutter_app/models/episode_model.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_flutter_app/screens/screens.dart';

class EpisodesWidget extends StatefulWidget {
  const EpisodesWidget({
    Key? key,
    required this.episode,
    required this.url,
  }) : super(key: key);

  final String episode;
  final String url;

  @override
  State<EpisodesWidget> createState() => _EpisodesWidgetState();
}

class _EpisodesWidgetState extends State<EpisodesWidget> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          loading = true;
        });
        print(widget.url);
        print('clicked');
        showEpisodeDetailScreen(context, widget.url);
        setState(() {
          loading = false;
        });
      },
      child: Container(
        height: 30.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(
            child: loading == true
                ? const CupertinoActivityIndicator()
                : Text(
                    widget.episode,
                    style: const TextStyle(color: Colors.white),
                  )),
      ),
    );
  }
}

void showEpisodeDetailScreen(BuildContext context, String url) async {
  final response = await http.Client().get(Uri.parse(url));

  var episodeResponse = Result.fromJson(json.decode(response.body));
  Result result = episodeResponse;

  Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            EpisodeDetailScreen(result: result),
        transitionDuration: const Duration(seconds: 0),
      ));
}
