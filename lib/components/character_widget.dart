import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({
    Key? key,
    required this.imageURL,
    required this.name,
    required this.species,
    required this.gender,
    required this.status,
  }) : super(key: key);

  final String imageURL;
  final String name;
  final String species;
  final String gender;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
          child: Image.network(imageURL),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          name,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          species,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Row(
          children: [
            Text(
              gender,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              status,
              style: TextStyle(
                color: status == 'Alive' ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
