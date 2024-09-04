import 'package:flutter/material.dart';
import 'package:waliamarket/utils/color_themes.dart';
import 'package:waliamarket/utils/constants.dart';
import 'package:waliamarket/utils/utils.dart';

class AccountScreenAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const AccountScreenAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);

  @override
  State<AccountScreenAppBar> createState() => _AccountScreenAppBarState();
}

class _AccountScreenAppBarState extends State<AccountScreenAppBar> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();

    return Container(
          height: kAppBarHeight,
          width:screenSize.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: backgroundGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight
            )
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(
                    'assets/images/logo.jpg',
                    height: screenSize.height * 0.1,
                    width: screenSize.width * 0.1,
                  ),
                ),
                Row(
                   children: [
                    IconButton(onPressed:(){}, icon:const Icon(Icons.notifications_outlined, color: Colors.white,)),

                    IconButton(onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>const SearchBar() ));

                    }, 
                    icon:const Icon(Icons.search_outlined,color: Colors.white,))

                   ],

                )
              ],

          ),





    );
  }
}
