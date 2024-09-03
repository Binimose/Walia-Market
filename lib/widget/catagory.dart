import 'package:flutter/material.dart';
import 'package:waliamarket/utils/constants.dart';

class CategoryHorizontalView extends StatelessWidget {
  const CategoryHorizontalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color to white
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(13),  
      child: SizedBox(
        height: 120,  
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(categoryLogos[index]),
                  ),
                  const SizedBox(height: 8), // Space between image and text
                  Text(categoriesList[index]),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
