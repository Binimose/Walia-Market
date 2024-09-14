import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waliamarket/model/product_model.dart';
import 'package:waliamarket/provider/user_detial_provider.dart';
import 'package:waliamarket/resource/cloud_firestore.dart';
import 'package:waliamarket/screens/product_screen.dart';
import 'package:waliamarket/utils/utils.dart';
import 'package:waliamarket/widget/custom_simple_rounded_button.dart';
import 'package:waliamarket/widget/custom_squer_button.dart';
import 'package:waliamarket/widget/product_informaion_Widget.dart';

class CartItemWidget extends StatelessWidget {
  final ProductModel productModel;
  const CartItemWidget({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Container(
        height: screenSize.height/2 ,
        width: screenSize.width,
        decoration: const BoxDecoration(
          border:Border(bottom: BorderSide(color:Color.fromARGB(255, 0, 0, 0),width: 2))
        ),
     

     child: Column(
      children: [
        Expanded(
          flex: 5,
          child:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: screenSize.width/3,
                    child:GestureDetector(
                      onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder:(context){
                    return ProductScreen(productModel: productModel);

                  }));

                      },
                      child: Center(
                      child:Image.network(productModel.url)
                      ),
                    ),
                  ),
                )
              , ProductInformaionWidget(productName: productModel.productName, cost: productModel.cost.toString(), sellerNmae:Provider.of<UserDetialProvider>(context).userDetail!.name,)

                
              ],
          ),
        
        ),




        Expanded(
          flex: 3,
          child:Row(
            children: [
              CustomSquerButton(
                onPressed:(){


                }, 
                child:  Icon(Icons.remove), 
                dimension:60
                ),

                CustomSquerButton(
                onPressed:(){
                   


                }, 
                child:Text("0"), 
                dimension:60
                ),

                CustomSquerButton(
                onPressed:(

                )async{
                  await CloudFireStorre().addProductToCart(productModel:ProductModel(
                              url: productModel.url,
                              productName: productModel.productName,
                              cost: productModel.cost,
                              discount: productModel.discount,
                              uid: Utils().getUid(),
                              sellerName: productModel.sellerName,
                              sellerUid: productModel.sellerUid,
                              rating: productModel.rating,
                              noOfRating: productModel.noOfRating));
                  Utils().showSnackBar(context: context, content:'Done');
                 
                }, 
                child:  Icon(Icons.add), 
                dimension:60
                )
            ],
          ),),



       Expanded(
        child:Row(
          children: [
            CustomSimpleRoundedButton(
              onPressed:(){
             CloudFireStorre().deleteProductFromCart(uid: productModel.uid);
             Utils().showSnackBar(context: context, content: 'Done !');
              }, 
              text:"Delete"
              ),
               CustomSimpleRoundedButton(
              onPressed:(){

              }, 
              text:"Save for letter"
              )
          ],
        )
        ,flex: 2,),

        Align(
          alignment: Alignment.bottomLeft,
          child: Text("See more like this",style: TextStyle(color: Colors.blue,fontSize: 17),))
      ],
     ),

    );
  }
}