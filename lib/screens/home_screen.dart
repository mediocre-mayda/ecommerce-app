import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerce_app/data/models/ad_model.dart';
import 'package:ecommerce_app/services/ads_service.dart';
import 'package:flutter/material.dart';
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

      results.forEach((result) {
        _ads.add(
          Ad(
              id: result['id'],
              title: result['title'],
              body: result['body'],
              image: result['image'],
              created_at: result['created_at']),
        );
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
            //adsCarousel(_ads),
          ],
        ),
      ),
    );
  }
}
