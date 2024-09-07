import 'package:flutter/material.dart';
import 'package:waliamarket/model/product_model.dart';
import 'package:waliamarket/screens/product_screen.dart';

class SimpleProductWidget extends StatelessWidget {
  final ProductModel productModel;

  const SimpleProductWidget({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.push(context, MaterialPageRoute(builder:(context){
          return ProductScreen(productModel: productModel,);
         }));
      },
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          height: 10,
          width:3,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.network(productModel.url),
          ),
        ),
      ),
    );
  }
}
