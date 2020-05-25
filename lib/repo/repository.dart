import 'package:http/http.dart' as http;

class Repository {
  String _baseUrl = 'http://192.168.1.170/ecommerce-api/public/api';
  var headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };

  httpGet(String api) async {
    return await http.get(_baseUrl + "/" + api);
  }
}
