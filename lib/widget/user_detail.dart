 

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waliamarket/model/user_detail.dart';
import 'package:waliamarket/provider/user_detial_provider.dart';
import 'package:waliamarket/utils/color_themes.dart';
import 'package:waliamarket/utils/utils.dart';

class UserDetail extends StatelessWidget {
  final double offset;
 
  const UserDetail({super.key, required this.offset, });

  @override
  Widget build(BuildContext context) {
    var screenSize = Utils().getScreenSize();
    UserDetailModel? UserDetail = Provider.of<UserDetialProvider>(context).userDetail;
    
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
                
                child: Text(" Delivered To ${UserDetail?.name}- ${UserDetail?.address}",
                maxLines:1,
                overflow: TextOverflow.ellipsis,
                
                ))
           
          ],
        ),
      
      ),
    );
  }
}