import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gtpl/api_layer/networking.dart';
import 'package:gtpl/query/const.dart';

class StarRating extends StatefulWidget {
  const StarRating({Key? key, required this.ticketId}) : super(key: key);
  final String ticketId;
  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  double _rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Center(
        child: AlertDialog(
          title: Text(
            'Rate our service',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          content: RatingBar.builder(
            initialRating: _rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                _rating = rating;
              });
              print("variable rating ---> $_rating");
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                giveRating(widget.ticketId, _rating.toInt());
                Navigator.pop(context);
              },
              child: Text(
                'Ok',
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
