import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class ReviewDialog extends StatelessWidget {
  const ReviewDialog({super.key});

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
        print(res.comment);
        print(res.rating);
      },
    );
  }
}