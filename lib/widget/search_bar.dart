import 'package:flutter/material.dart';
import 'package:waliamarket/screens/result_screen.dart';
import 'package:waliamarket/screens/search_screen.dart';
import 'package:waliamarket/utils/color_themes.dart';
import 'package:waliamarket/utils/constants.dart';
import 'package:waliamarket/utils/utils.dart'; // Adjust the import to your project structure

class SearchBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool isReadOnly;
  final bool hasBackButton;

  const SearchBarWidget({
    Key? key,
    required this.isReadOnly,
    required this.hasBackButton,
  })  : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  OutlineInputBorder get border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 1,
        ),
      );

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();// Get screen size
    return Container(
      height: kAppBarHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Back Button
          if (hasBackButton)
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back,color:Colors.white,),
            )
          else
            Container(),
          // Search Field
          SizedBox(
            width: screenSize.width * 0.6,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: TextField(
                onSubmitted: (String query){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                     return ResultScreen(query: query);
                   }));
                },
                readOnly: isReadOnly,
                onTap: () {
                  if(isReadOnly){
                    Navigator.push(context, 
                    MaterialPageRoute(builder:(context)=>SearchScreen()
                    )
                    
                    
                    );
                  }
                 
                },
               
                decoration: InputDecoration(
                  hintText: "Search for something in Walia Market",
                  fillColor: Colors.white,
                  filled: true,
                  border: border,
                  focusedBorder: border,
                ),
              ),
            ),
          ),
          // Additional Icon or Button (Optional)
          IconButton(
            onPressed: () {
              // Add functionality if needed
            },
            icon: const Icon(Icons.mic,color:Colors.white,),
          ),
        ],
      ),
    );
  }
}
