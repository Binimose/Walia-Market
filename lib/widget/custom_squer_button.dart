import 'package:flutter/material.dart';

class CustomSquerButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double dimension;
  const CustomSquerButton({super.key, required this.onPressed, required this.child, required this.dimension});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
       height: dimension,
       width: dimension,
       decoration: ShapeDecoration(shape:RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.grey,width:1
          
        ),
        borderRadius: BorderRadius.circular(2)
       )),
      child: Center(child: child,),
      ),
    );
  }
}