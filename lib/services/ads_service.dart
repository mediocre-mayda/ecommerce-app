import 'package:ecommerce_app/repo/repository.dart';

class AdsService {
  Repository _repository;
  AdsService() {
    _repository = Repository();
  }

  getAllAds() async {
    return await _repository.httpGet('ads');
  }
}
