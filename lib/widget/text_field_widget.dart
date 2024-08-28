 import 'package:flutter/material.dart';

class TextFieldController extends StatefulWidget {
  final String title;
  final bool obscure;
  final String hintText;
  final TextEditingController controller;

  const TextFieldController({
    super.key,
    required this.title,
    required this.obscure,
    required this.controller, 
    required this.hintText,
  });

  @override
  State<TextFieldController> createState() => _TextFieldControllerState();
}

class _TextFieldControllerState extends State<TextFieldController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21
          ),
        ),
        const SizedBox(height: 8), // Add some spacing between the title and the TextField
        TextField(
          controller: widget.controller,
          obscureText: widget.obscure,
          maxLines: 1,
          decoration: InputDecoration(
            hintText:widget.hintText,
            border: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 1),
            
            ),
            focusedBorder:const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 216, 0, 0))
            )
          ),
        ),
      ],
    );
  }
}