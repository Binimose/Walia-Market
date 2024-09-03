import 'package:flutter/material.dart';

class SimpleProductWidget extends StatelessWidget {
  final String url;

  const SimpleProductWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle tap event
      },
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          height: 10,
          width:3,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.network(url),
          ),
        ),
      ),
    );
  }
}
