import 'package:flutter/material.dart';
import 'package:waliamarket/utils/utils.dart';
import 'package:waliamarket/widget/cost_widget.dart';

class ProductInformaionWidget extends StatelessWidget {
  final String productName;
  final String cost;
  final String sellerNmae;
  const ProductInformaionWidget({super.key, required this.productName, required this.cost, required this.sellerNmae});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    SizedBox spaceThingy = const SizedBox(height:10,);
    return SizedBox(
         width:screenSize.width/2,
         child: Column(
          children: [
            Text(
              productName,
              maxLines:2,
              overflow:TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.w500,fontSize:16,letterSpacing: 0.8),
            ),
            spaceThingy,
            CostWidget(color:Colors.black, cost:500.88),
            spaceThingy,
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(text:TextSpan(
                children: [
                  TextSpan(text: 'Sold by   ',style: TextStyle(color: Colors.grey[700], fontSize: 14)
                  ),
                  TextSpan(text:sellerNmae,style: TextStyle(color: const Color.fromARGB(255, 9, 84, 223),))
                ]
              )),
            )


          ],
         ),
    );
  }
}