import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:rick_and_morty_flutter_app/components/app_components.dart';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty_flutter_app/models/location_model.dart';
import 'package:rick_and_morty_flutter_app/screens/screens.dart';

class LoactionScreen extends StatefulWidget {
  const LoactionScreen({Key? key}) : super(key: key);

  @override
  State<LoactionScreen> createState() => _LoactionScreenState();
}

class _LoactionScreenState extends State<LoactionScreen> {
  int selectedOption = 1;
  static int pageNumber = 1;
  bool endOfList = false;
  List<Result> result = [];

  Future<List<Result>> pageData(int offset) async {
    List<Result> empty = [];

    if (endOfList == false) {
      final response = await http.Client().get(Uri.parse(
          'https://rickandmortyapi.com/api/location/?page=$pageNumber'));

      var locationResponse =
          LocationResponse.fromJson(json.decode(response.body));

      result = locationResponse.results;

      if (pageNumber == locationResponse.info.pages) {
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
              selectedOption: 2,
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
                    'Location',
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
                                return LocationDetailScreen(result: result);
                              },
                            ));
                          },
                          child: LocationWidget(
                            name: result.name,
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
                            Text('Loading Location ... '),
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
