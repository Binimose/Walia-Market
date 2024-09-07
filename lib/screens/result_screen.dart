import 'package:flutter/material.dart';
import 'package:waliamarket/model/product_model.dart';
import 'package:waliamarket/utils/constants.dart';
import 'package:waliamarket/widget/result_widget.dart';
import 'package:waliamarket/widget/search_bar.dart';

class ResultScreen extends StatelessWidget {
  final String query;
  
  const ResultScreen({super.key, required this.query, });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: SearchBarWidget(
      isReadOnly: false,
       hasBackButton:true
       ),
        body: Column(
      children: [
        Center(
          
          child: Padding(
            padding: const  EdgeInsets.symmetric(vertical: 10),
            child: RichText(text: TextSpan(
              children: [
                TextSpan(text: "Showing result for " ,style:TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.black) ),
      
                TextSpan(text:query, style:TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.black))
              ]
            )),
          ),
        ),
      
        Expanded(
          child: GridView.builder(
            itemCount: categoryLogos.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2.2/3.5,
              crossAxisCount:3,
              mainAxisSpacing: 10
              ),
             itemBuilder:(context,index){
              return ResultWidget(product: ProductModel(
                url: categoryLogos[index], 
                productName: 'Niky Shoe',
                 cost: 400, 
                 discount: 100, 
                 uid: '', 
                 sellerName:'Binimose', 
                 sellerUid: '', 
                 rating: 1, 
                 noOfRating:4
                 )
              );
             }
             
             ),
        )
      ],
        ),
      
      
      ),
    );
  }
}