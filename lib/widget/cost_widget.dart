import 'package:flutter/material.dart';

class CostWidget extends StatelessWidget {
  final Color color;
  final double cost;


  const CostWidget({super.key, required this.color, required this.cost});

  @override
  Widget build(BuildContext context) {
    return Row(
         
         children: [
          Text(
            cost.toInt().toString()
            ,style: TextStyle(
              color: color,
              fontSize:25,
              fontWeight: FontWeight.w800 
            ),
          ),

          Text(
            (cost-cost.truncate()).toString(),
            style: TextStyle(
              fontSize: 10,
              fontFeatures: const[
                FontFeature.superscripts()
              ]
            ),
          )
         ],



    );
  }
}