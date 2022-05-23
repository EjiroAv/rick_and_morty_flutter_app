import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:rick_and_morty_flutter_app/components/app_components.dart';
import 'package:rick_and_morty_flutter_app/models/character_model.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_flutter_app/screens/screens.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  int selectedOption = 1;
  static int pageNumber = 1;

  Future<List<Result>> pageData(int offset) async {
    print(offset);
    final response = await http.Client().get(Uri.parse(
        'https://rickandmortyapi.com/api/character/?page=$pageNumber'));
    pageNumber++;
    var characterResponse =
        CharacterResponse.fromJson(json.decode(response.body));
    return characterResponse.results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
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
                                return CharacterDetailScreen(
                                  result: result,
                                );
                              },
                            ));
                          },
                          child: CharacterWidget(
                              imageURL: result.image,
                              name: result.name,
                              species: result.species!,
                              gender: result.gender!,
                              status: result.status!),
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
                            Text('Loading Characters ... '),
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
