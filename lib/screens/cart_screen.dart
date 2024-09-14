 

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waliamarket/model/product_model.dart';
import 'package:waliamarket/provider/user_detial_provider.dart';
import 'package:waliamarket/resource/cloud_firestore.dart';
import 'package:waliamarket/utils/utils.dart';
import 'package:waliamarket/widget/cart_item_widget.dart';
import 'package:waliamarket/widget/custom_primery_button.dart';
import 'package:waliamarket/widget/search_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CartScreen extends StatelessWidget {
   
  
  const CartScreen({super.key,});

  @override
  Widget build(BuildContext context) {
  
    return  SafeArea(
      child: Scaffold(
         appBar:const SearchBarWidget(
      isReadOnly:true, 
      hasBackButton:false
      ),
        
        body:Center(
      child: Column(
        
        children: [
          
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.
              collection('Users').
              doc(FirebaseAuth.instance.currentUser!.uid).collection('cart').snapshots(), builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) { 
                if(snapshot.connectionState == ConnectionState.waiting){
                  return CustomPrimeryButton(
                              child: const Text(
                                "Loading",
                              ),
                              color: Colors.black,
                              isLoading:true,
                              onPressed: () {


                              });
                }else{
                  return CustomPrimeryButton(
                    child: Text('proceed to buy (${snapshot.data!.docs.length})'), 
                    isLoading: false,
                     onPressed: (){

                      CloudFireStorre().buyAllItemInCart(userDetial:Provider.of<UserDetialProvider>(context,listen: false).userDetail!);
                      Utils().showSnackBar(context: context, content: "Done!");
                     },
                      color:Colors.black
                      );
                }
               },
               
               )
          ),
         Expanded(child: 
         StreamBuilder(
          stream:  FirebaseFirestore.instance
                     
                     
                     .collection('Users')
                     .doc(FirebaseAuth.instance.currentUser!.uid)
                     .collection('cart')
                     .snapshots(),
          
         builder: (
          BuildContext context, 
          AsyncSnapshot<dynamic> snapshot) { 

            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            }else{
                 return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder:(context,index){
                   ProductModel model = ProductModel.getModelFromJson(json: snapshot.data!.docs[index].data());   
                  return CartItemWidget(productModel: model);


                  });



            }

           },
         )
         )
        ],
        
      ),
        )
      
      
      ),
    );
  }
}