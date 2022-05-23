import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({Key? key, required this.title, required this.detail})
      : super(key: key);

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(detail),
        const SizedBox(
          height: 10.0,
        )
      ],
    );
  }
}
