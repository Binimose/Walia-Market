import 'package:flutter/material.dart';
import 'package:waliamarket/utils/constants.dart';

class CatagoryMorescreen extends StatelessWidget {
  final int index;
  const CatagoryMorescreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color:Colors.black.withOpacity(0.3),blurRadius: 8,spreadRadius: 1),]
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(categoryLogos[index]),
          ),
          Text(categoriesList[index])
        ],
      ),
    );
  }
}