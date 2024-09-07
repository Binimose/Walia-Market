import 'package:flutter/material.dart';
import 'package:waliamarket/model/product_model.dart';
import 'package:waliamarket/screens/product_screen.dart';
import 'package:waliamarket/utils/utils.dart';
import 'package:waliamarket/widget/custom_simple_rounded_button.dart';
import 'package:waliamarket/widget/custom_squer_button.dart';
import 'package:waliamarket/widget/product_informaion_Widget.dart';

class CartItemWidget extends StatefulWidget {
  final ProductModel productModel;
  const CartItemWidget({super.key, required this.productModel});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
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
                    return ProductScreen(productModel: widget.productModel);

                  }));

                      },
                      child: Center(
                      child:Image.network("https://m.media-amazon.com/images/I/11M0jYc-tRL._SX90_SY90_.png")
                      ),
                    ),
                  ),
                )
              ,const ProductInformaionWidget(productName: 'Car spare part for a new modern car Widget', cost: '3000', sellerNmae: 'binimose',)

                
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
                onPressed:(){

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