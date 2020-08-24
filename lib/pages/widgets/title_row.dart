import 'package:flutter/material.dart';

class TittleRow extends StatelessWidget {
  const TittleRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star_border,
          color: Colors.yellow,
          size: 45,
        ),
        const Text(
          'Flutter Slots',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(
          Icons.star_border,
          color: Colors.white,
          size: 45,
        ),
      ],
    );
  }
}
