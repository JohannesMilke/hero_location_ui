import 'package:flutter/material.dart';
import 'package:hero_location_ui/data/hero_tag.dart';
import 'package:hero_location_ui/data/locations.dart';
import 'package:hero_location_ui/model/location.dart';
import 'package:hero_location_ui/model/review.dart';
import 'package:hero_location_ui/widget/hero_widget.dart';

class ReviewsWidget extends StatelessWidget {
  final Location location;
  final Animation animation;

  const ReviewsWidget({
    @required this.location,
    @required this.animation,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.separated(
      itemCount: location.reviews.length,
      padding: EdgeInsets.all(16),
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        final review = location.reviews[index];

        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) => FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Interval(0.2, 1, curve: Curves.easeInExpo),
            ),
            child: child,
          ),
          child: buildReview(review),
        );
      });

  Widget buildReview(Review review) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeroWidget(
                  tag: HeroTag.avatar(review, locations.indexOf(location)),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black12,
                    backgroundImage: AssetImage(review.urlImage),
                  ),
                ),
                Text(
                  review.username,
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(),
                Text(
                  review.date,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Icon(Icons.thumb_up_alt_outlined, size: 14)
              ],
            ),
            SizedBox(height: 8),
            Text(
              review.description,
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      );
}
