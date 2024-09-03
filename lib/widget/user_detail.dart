 

import 'package:flutter/material.dart';
import 'package:waliamarket/model/user_detail.dart';
import 'package:waliamarket/utils/color_themes.dart';
import 'package:waliamarket/utils/utils.dart';

class UserDetail extends StatelessWidget {
  final double offset;
  final User user;
  const UserDetail({super.key, required this.offset, required this.user});

  @override
  Widget build(BuildContext context) {
    var screenSize = Utils().getScreenSize();
    
    return Positioned(
      top: -offset/20,
      child: Container(
         
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors:[yellowColor,Color.fromARGB(255, 29, 27, 27)],)
        ),
        child: Row(
          
          children: [
               const Padding(
                    padding: EdgeInsets.only(right: 10),
                 child: Icon(Icons.location_on_outlined),
               ),
               SizedBox(
                width: screenSize.width,
                
                child: Text(" Delivered To${user.name}- ${user.address}",
                maxLines:1,
                overflow: TextOverflow.ellipsis,
                
                ))
           
          ],
        ),
      
      ),
    );
  }
}