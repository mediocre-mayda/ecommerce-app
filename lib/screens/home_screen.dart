import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerce_app/data/models/ad_model.dart';
import 'package:ecommerce_app/services/ads_service.dart';
import 'package:ecommerce_app/widgets/ads_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  var _ads = [];
  // the Black box that knows how to get Ads data from the api
  AdsService _adsService = AdsService();

  @override
  void initState() {
    super.initState();
    _getAllAds();
    _controller = AnimationController(vsync: this);
  }

  _getAllAds() async {
    http.Response adsResponse = await _adsService.getAllAds();

    //we have a List here because we're retrieving a List of ads (20 ads)
    if (adsResponse.statusCode == 200 && adsResponse.body != null) {
      List<dynamic> results = json.decode(adsResponse.body);
      // for each result object (Map object) we iterate and create an object of type Ad (ad_model.dart) then we add all the created
      // Ad objects to the _ads List
      results.forEach((result) {
        setState(() {
          _ads.add(
            Ad(
              id: result['id'],
              title: result['title'],
              body: result['body'],
              image: result['image'],
              created_at: result['created_at'],
            ),
          );
        });
      });
    }

    _ads.forEach((element) {
      print(element);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Placeholder Store'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            adsCarousel(_ads),
            SizedBox(height: 20.0),
            Center(
              child: Text("المنتجات الجومية",
                  style: GoogleFonts.tajawal(
                      fontStyle: FontStyle.normal, fontSize: 25)),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                new BorderRadius.all(new Radius.circular(20.0)),
                            border: new Border.all(),
                          ),
                          margin: EdgeInsets.only(bottom: 10.0),
                          width: MediaQuery.of(context).size.width / 2,
                          child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://cloudfront.bjsrestaurants.com/img_5e73a6219831c5.05938695_half-off-large-pizzas-header-720x360.jpg",
                            ),
                          ),
                        ),
                        Center(
                          child: Text("Yummy Pizza"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(FontAwesomeIcons.productHunt),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(FontAwesomeIcons.info),
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
