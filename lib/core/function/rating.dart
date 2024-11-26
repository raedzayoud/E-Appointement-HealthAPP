import 'package:flutter/material.dart';
import 'package:health_app/core/constant/imageassets.dart';
import 'package:health_app/linkapi.dart';
import 'package:rating_dialog/rating_dialog.dart';

rating(BuildContext context){

  final _dialog = RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        '',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 0,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      starSize: 34,
      // your app's logo?
      image: Container(child: Transform.scale(
      scale: 1.3,
      child: Image.asset(AppImageassets.secondlogo)),),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, comment: ${response.comment}');

        // TODO: add your own logic
        if (response.rating < 3.0) {
          // send their comments to your email or anywhere you wish
          // ask the user to contact you instead of leaving a bad review
        } else {
         // _rateAndReviewApp();
        }
      },
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => _dialog,
    );

}