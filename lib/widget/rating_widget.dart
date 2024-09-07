import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final int rating;
  const RatingWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    List<Widget> childern =[];
    for(int i=1;i<5;i++){
      childern.add(
        i < rating ? Icon(Icons.star,color: Colors.orange,): Icon(Icons.star_border,color: Colors.orange,)
      );
    }
    return Row(
      
      children:childern,
    );
  }
}