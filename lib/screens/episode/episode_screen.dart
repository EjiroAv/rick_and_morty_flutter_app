import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:rick_and_morty_flutter_app/components/app_components.dart';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty_flutter_app/models/episode_model.dart';
import 'package:rick_and_morty_flutter_app/screens/screens.dart';

class EpisodeScreen extends StatefulWidget {
  const EpisodeScreen({Key? key}) : super(key: key);

  @override
  State<EpisodeScreen> createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends State<EpisodeScreen> {
  int selectedOption = 1;
  static int pageNumber = 1;
  bool endOfList = false;
  List<Result> result = [];

  Future<List<Result>> pageData(int offset) async {
    List<Result> empty = [];

    if (endOfList == false) {
      final response = await http.Client().get(Uri.parse(
          'https://rickandmortyapi.com/api/episode/?page=$pageNumber'));

      var episodeResponse =
          EpisodeResponse.fromJson(json.decode(response.body));

      result = episodeResponse.results;

      if (pageNumber == episodeResponse.info!.pages) {
        endOfList = true;
      } else {
        pageNumber++;
      }
    } else {
      return empty;
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AppSideBar(
              selectedOption: 3,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Episode',
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: PaginationView<Result>(
                      // pullToRefresh: true,
                      shrinkWrap: true,
                      itemBuilder:
                          (BuildContext context, Result result, int index) {
                        return GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return EpisodeDetailScreen(result: result);
                              },
                            ));
                          },
                          child: Episodes(
                            name: result.name,
                            episode: result.episode,
                          ),
                        );
                      },
                      pageFetch: pageData,
                      onEmpty: const Center(
                        child: Text('Sorry! No result available'),
                      ),
                      onError: (dynamic error) => const Center(
                        child: Text('Some error occured'),
                      ),
                      bottomLoader: Center(
                        child: Row(
                          children: const [
                            Text('Hold On ... '),
                            CupertinoActivityIndicator(),
                          ],
                        ),
                      ),
                      initialLoader: Center(
                        child: Row(
                          children: const [
                            Text('Loading Episodes ... '),
                            CupertinoActivityIndicator(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
