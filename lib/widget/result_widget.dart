import 'package:flutter/material.dart';
import 'package:waliamarket/model/product_model.dart';
import 'package:waliamarket/utils/utils.dart';
import 'package:waliamarket/widget/rating_widget.dart';

class ResultWidget extends StatelessWidget {
  final ProductModel product;
  const ResultWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size screenSize =Utils().getScreenSize();
    return Container(
       width:screenSize.width
         ,child: Column(
          children: [
            Image.network(product.url),
            SizedBox(height: 4,),
            Text(product.productName,maxLines: 3,overflow: TextOverflow.ellipsis,),
            SizedBox(height: 4,),
            
            Row(
             children: [
              Text( product.noOfRating.toString(),style: TextStyle(fontWeight:FontWeight.w500),),
              RatingWidget(rating: 3),
             ],
            
            )
,            SizedBox(height: 4,),
            Text(product.cost.toString(),style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color:Colors.red))
          ],
         ),

    );
  }
}