import 'package:flutter/material.dart';

class CustomSimpleRoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CustomSimpleRoundedButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 120,
          height: 30,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 0, 0),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey,width: 1)
          ),
          child:Center(child: Text(text,style: TextStyle(color: const Color.fromARGB(255, 245, 240, 240),fontSize: 17),)),
        ),
      ),
    );
  }
}