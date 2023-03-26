import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({super.key, required this.rating});

final int rating;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating.toDouble(),
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 15.w,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
      },
      ignoreGestures: true,
    );
  }
}
