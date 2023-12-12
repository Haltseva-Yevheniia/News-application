import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_application/models/news_model.dart';

class NetworkRequest {

  String apiKey = '8297025629a69cfad955ab4c9ed427f0';
  String urlRequestPrefix = 'http://api.mediastack.com/v1/news ? access_key = ';

Future<List<NewsModel>> getNews () async {
  Uri url = Uri.parse('$urlRequestPrefix$apiKey');
  final http.Response response = await http.get(url);
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data['data'] != null) {
      return data['data'].map<NewsModel> ((element) => NewsModel.fromJson(element)).toList();
    } else {
      throw Exception('Error. The list is empty');
    }
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}

}