import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        children: const [
          Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
            size: 15.0,
          ),
          SizedBox(
            width: 5.0,
          ),
          Text('Back'),
        ],
      ),
    );
  }
}
