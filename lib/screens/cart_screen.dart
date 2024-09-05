
import 'package:flutter/material.dart';
import 'package:waliamarket/model/user_detail.dart';
import 'package:waliamarket/widget/cart_item_widget.dart';
import 'package:waliamarket/widget/custom_primery_button.dart';
import 'package:waliamarket/widget/search_bar.dart';
import 'package:waliamarket/widget/user_detail.dart';

class CartScreen extends StatelessWidget {
  
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    return  Scaffold(
   appBar:const SearchBarWidget(
    isReadOnly:true, 
    hasBackButton:false
    ),
  
  body:Center(
    child: Column(
      
      children: [
        
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: CustomPrimeryButton(
            isLoading:false,
              onPressed:(){
                
              },
               color:Colors.black,
            child:const Text('Proceed To Buy (n) Item',style: TextStyle(color:Colors.white),)),
        ),
       Expanded(child:ListView.builder(
       itemCount: 5,
        itemBuilder:(context,index){
          return CartItemWidget();
        }
        )
       )
      ],
      
    ),
  )


    );
  }
}