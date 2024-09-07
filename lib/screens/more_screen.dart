import 'package:flutter/material.dart';
import 'package:waliamarket/utils/constants.dart';
import 'package:waliamarket/widget/catagory_morescreen.dart';
import 'package:waliamarket/widget/search_bar.dart';

class Morescreen extends StatelessWidget {
  const Morescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: const SearchBarWidget(
      isReadOnly: true,
       hasBackButton:false),
       body: Padding(
        padding: const EdgeInsets.all(8),
        child:GridView.builder(
          itemCount: categoriesList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:3,
            childAspectRatio: 2.2/3.5,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15
      
            ), 
          itemBuilder: (context,index)=>CatagoryMorescreen(index: index)),
        )
      ),
    );
  }
}