import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key, required this.name}) : super(key: key);

  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            height: 75.0,
            padding: const EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Colors.black),
            ),
            child: Center(
                child: Text(
              name,
              textAlign: TextAlign.center,
            )),
          ),
        ),
        const SizedBox(
          height: 10.0,
        )
      ],
    );
  }
}
