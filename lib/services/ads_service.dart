import 'package:ecommerce_app/repo/repository.dart';

// responsible for connecting to the Ads api endpoint and retreiving the Ads data.
class AdsService {
  // the other blackbox that knows exactly how to connect to the api
  Repository _repository;
  AdsService() {
    _repository = Repository();
  }

  getAllAds() async {
    return await _repository.httpGet('ads');
  }
}
