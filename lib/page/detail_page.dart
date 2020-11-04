import 'package:flutter/material.dart';
import 'package:hero_location_ui/data/hero_tag.dart';
import 'package:hero_location_ui/model/location.dart';
import 'package:hero_location_ui/widget/detailed_info_widget.dart';
import 'package:hero_location_ui/widget/hero_widget.dart';
import 'package:hero_location_ui/widget/lat_long_widget.dart';
import 'package:hero_location_ui/widget/reviews_widget.dart';

class DetailPage extends StatelessWidget {
  final Location location;
  final Animation animation;

  const DetailPage({
    @required this.location,
    @required this.animation,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('INTERESTS'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: Navigator.of(context).pop,
            ),
            SizedBox(width: 10)
          ],
          leading: Icon(Icons.search_outlined),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox.expand(
                    child: HeroWidget(
                      tag: HeroTag.image(location.urlImage),
                      child: Image.asset(location.urlImage, fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: LatLongWidget(location: location),
                  ),
                ],
              ),
            ),
            DetailedInfoWidget(location: location),
            Expanded(
              flex: 5,
              child: ReviewsWidget(location: location, animation: animation),
            ),
          ],
        ),
      );
}
