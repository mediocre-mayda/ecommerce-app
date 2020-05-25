import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerce_app/services/ads_service.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  var _ads = [];
  AdsService _adsService = AdsService();

  @override
  void initState() {
    super.initState();
    _getAllAds();
    _controller = AnimationController(vsync: this);
  }

  _getAllAds() async {
    var ads = await _adsService.getAllAds();
    //we have a List here because we're retrieving a List of ads (20 ads)
    List<dynamic> results = json.decode(ads.body);

    results.forEach((result) {
      print("${result["image"]}\n");
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
            //adsCarousel(_ads),
          ],
        ),
      ),
    );
  }
}
