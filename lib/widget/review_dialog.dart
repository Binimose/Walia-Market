import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:waliamarket/model/review_model.dart';
import 'package:waliamarket/provider/user_detial_provider.dart';
import 'package:waliamarket/resource/cloud_firestore.dart';

class ReviewDialog extends StatelessWidget {
 final  String ProductUid;
  const ReviewDialog({super.key, required this.ProductUid});

  @override
  Widget build(BuildContext context) {
    return RatingDialog(
      
      title: const Text(
        'Type a review for this product!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
       message: const Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
      
      submitButtonText: 'Submit',
      commentHint: 'Type your comment on the item here',
      onCancelled: () => print('cancelled'),
       
      onSubmitted: (RatingDialogResponse res) {
        
   CloudFireStorre().uploadReviewToDatabase(
    productUid: ProductUid, model:ReviewModel(
      
      senderName: Provider.of<UserDetialProvider>(context,listen:false).userDetail!.name, 
      
      description:res.comment,
       rating:res.rating.toInt()
       
       ));





      },
    );
  }
}