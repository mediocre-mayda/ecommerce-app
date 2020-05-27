import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerce_app/data/models/ad_model.dart';
import 'package:flutter/material.dart';

Widget adsCarousel(List<dynamic> ads) {
  return SizedBox(
    height: 250,
    child: Carousel(
      showIndicator: false,
      boxFit: BoxFit.cover,
      images: ads
          .map(
            (ad) => NetworkImage(
              ad.image,
            ),
          )
          .toList(),
      animationCurve: Curves.fastOutSlowIn,
      autoplay: true,
      animationDuration: Duration(milliseconds: 1000),
    ),
  );
}
