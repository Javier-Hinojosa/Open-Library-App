import 'package:flutter/material.dart';
import 'package:open_library/app/widgets/text.widget.dart';


class RatingWidget extends StatelessWidget {
  final double rating;
  final int starCount;

  const RatingWidget({
    Key? key,
    required this.rating,
    this.starCount = 5, // Por defecto, 5 estrellas
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(starCount, (index) {
          double starValue = index + 1;
          return Icon(
            starValue <= rating
                ? Icons.star
                : (starValue - rating < 1 && starValue - rating > 0)
                ? Icons.star_half
                : Icons.star_border,
            color: Colors.amber,
            size: 20
          );
        }),
        SizedBox(width: 4),
        CustomText(
          rating.toStringAsFixed(1),
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
            fontWeight: FontWeight.bold))
      ]);
  }
}