
import 'package:flutter/material.dart';

import 'package:waliamarket/model/product_model.dart';
import 'package:waliamarket/model/review_model.dart';
import 'package:waliamarket/model/user_detail.dart';
import 'package:waliamarket/utils/color_themes.dart';
import 'package:waliamarket/utils/constants.dart';
import 'package:waliamarket/utils/utils.dart';
import 'package:waliamarket/widget/cost_widget.dart';
import 'package:waliamarket/widget/custom_primery_button.dart';
import 'package:waliamarket/widget/custom_simple_rounded_button.dart';
import 'package:waliamarket/widget/rating_widget.dart';
import 'package:waliamarket/widget/review_widget.dart';
import 'package:waliamarket/widget/search_bar.dart';
import 'package:waliamarket/widget/user_detail.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductScreen({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Expanded spaceThingy = Expanded(child: Container());
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return SafeArea(
      child: Scaffold(
        appBar: SearchBarWidget(isReadOnly: true, hasBackButton: true),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenSize.height -
                          (kAppBarHeight + (kAppBarHeight / 2)),
                      child: Column(
                        children: [
                          
                          const SizedBox(
                            height: kAppBarHeight / 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        widget.productModel.sellerName,
                                        style: const TextStyle(
                                            color: activeCyanColor,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Text(widget.productModel.productName),
                                  ],
                                ),
                                RatingWidget(
                                    rating: widget.productModel.rating),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              height: screenSize.height / 3,
                              constraints: BoxConstraints(
                                  maxHeight: screenSize.height / 3),
                              child: Image.network(widget.productModel.url),
                            ),
                          ),
                          spaceThingy,
                          CostWidget(
                              color: Colors.black,
                              cost: widget.productModel.cost),
                          spaceThingy,
                          CustomPrimeryButton(
                              child: const Text(
                                "Buy Now",
                                style: TextStyle(color: Colors.black),
                              ),
                              color: Colors.orange,
                              isLoading: false,
                              onPressed: () async {
                                 
                              }),
                          spaceThingy,
                          CustomPrimeryButton(
                              child: const Text(
                                "Add to cart",
                                style: TextStyle(color: Colors.black),
                              ),
                              color: yellowColor,
                              isLoading: false,
                              onPressed: () async {
                                 
                              }),
                          spaceThingy,
                          CustomSimpleRoundedButton(
                              onPressed: () {
                                 
                              },
                              text: "Add a review for this product"),
                        ],
                      ),
                    ),
                    
                    SizedBox(
  height: screenSize.height / 3, // Adjust the height as needed
  child: ListView.builder(
    shrinkWrap: true,
    itemCount: 10, // Use actual count of reviews
    itemBuilder: (context, index) {
      return ReviewWidget(
        review: ReviewModel(
          senderName: 'Iphone 15 promax',
          description: 'Highest quality',
          rating: 4,
        ),
      );
    },
  ),
),


                  ],
                ),
              ),
            ),
            UserDetail(
              offset: 0, user:User(name: '', address: ''),
            )
          ],
        ),
      ),
    );
  }
}
