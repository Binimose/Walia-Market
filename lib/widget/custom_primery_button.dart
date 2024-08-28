
import 'package:flutter/material.dart';
import 'package:waliamarket/utils/utils.dart';

class CustomPrimeryButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final bool isLoading;
  final VoidCallback onPressed;
  const CustomPrimeryButton({super.key, required this.child, required this.isLoading,  required this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
       backgroundColor: color,
       fixedSize: Size(screenSize.width *0.5,40)
      )
      ,onPressed: onPressed,
       child: isLoading ?  Padding(
         padding: const EdgeInsets.symmetric(vertical: 5),
         child: AspectRatio(
          aspectRatio: 1/1,
          child: CircularProgressIndicator(color:Colors.red,)),
       ):child
       );
       
  }
}