import 'package:http/http.dart' as http;

// Implementing the seperation of conecerns principle one of the SOLID oop principles
class Repository {
  String _baseUrl = 'http://192.168.1.170/ecommerce-api/public/api';
  var headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };

  httpGet(String api) async {
    return await http.get(_baseUrl + "/" + api, headers: headers);
  }
}
