import 'package:flutter/material.dart';

class SelectedOptionIndicator extends StatelessWidget {
  const SelectedOptionIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 5,
          width: 5,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
      ],
    );
  }
}
