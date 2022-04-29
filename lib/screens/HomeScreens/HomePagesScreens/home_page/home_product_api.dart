import 'dart:convert';

import 'package:http/http.dart' as http;

class HomeApiController {
  String productApi = "https://inpaket.com/wp-json/wp/v2/categories?consumer_key=ck_4f71f1870361aedd0f52051035854523e7cef4d5&consumer_secret=cs_a2560388e81d300960f4274fce56b2f8a6bc0e8b";
  Future<List> getAllProduct() async {
    try {
      var response = await http.get(Uri.parse(productApi));
      print(response.statusCode);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (SocketException) {
      return Future.error("Error Fetching Data");
    }
  }
}
