
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:waliamarket/model/product_model.dart';
import 'package:waliamarket/model/review_model.dart';
import 'package:waliamarket/model/user_detail.dart';
import 'package:waliamarket/provider/user_detial_provider.dart';
import 'package:waliamarket/resource/cloud_firestore.dart';
import 'package:waliamarket/utils/color_themes.dart';
import 'package:waliamarket/utils/constants.dart';
import 'package:waliamarket/utils/utils.dart';
import 'package:waliamarket/widget/cost_widget.dart';
import 'package:waliamarket/widget/custom_primery_button.dart';
import 'package:waliamarket/widget/custom_simple_rounded_button.dart';
import 'package:waliamarket/widget/rating_widget.dart';
import 'package:waliamarket/widget/review_dialog.dart';
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
                                style: TextStyle(color: Color.fromARGB(255, 255, 253, 253)),
                              ),
                              color: const Color.fromARGB(255, 0, 0, 0),
                              isLoading: false,
                              onPressed: () async {
                                CloudFireStorre().addProductToOrders(model:widget.productModel, userDetial: Provider.of<UserDetialProvider>(context,listen: false).userDetail!);
                                 Utils().showSnackBar(context: context, content: 'Done !');
                              }),
                          spaceThingy,
                          CustomPrimeryButton(
                              child: const Text(
                                "Add to cart",
                                style: TextStyle(color: Color.fromARGB(255, 243, 240, 240)),
                              ),
                              color: const Color.fromARGB(255, 7, 7, 7),
                              isLoading: false,
                              onPressed: () async {

                                 await CloudFireStorre().addProductToCart(productModel:widget.productModel);
                                 Utils().showSnackBar(context: context, content: 'Added to cart.');


                                 
                              }),
                          spaceThingy,
                          CustomPrimeryButton(
                              onPressed: () {
                                showDialog(
                                       context: context,
                                    builder: (context) => ReviewDialog(ProductUid:widget.productModel.uid,)
                                   );
                                 
                              },
                              isLoading:false,
                              color:Colors.grey,
                              child:Text( "Add a review for this product" ,style: TextStyle(color:Colors.black)),),
                        ],
                      ),
                    ),
                    
     SizedBox(
                     height: screenSize.height / 3, // Adjust the height as needed
                         child: StreamBuilder(
                   stream: FirebaseFirestore.instance
                     .collection("products")
                     .doc(widget.productModel.uid)
                     .collection("reviews")
                     .snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      
      } 
      
      else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
        return ListView.builder(
          itemCount: snapshot.data!.docs.length, 

          itemBuilder: (context, index) {
            ReviewModel model = ReviewModel.getModelFromJson(
                json: snapshot.data!.docs[index].data());
            return ReviewWidget(review: model);  
          },
        );
      } else {
        
        return Center(child: Text('No reviews available'));
      }
    },
  ),
)


                  ],
                ),
              ),
            ),
            UserDetail(
              offset: 0, 
            )
          ],
        ),
      ),
    );
  }
}
