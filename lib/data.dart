import 'dart:convert';

import 'package:apis/classes.dart';
import 'package:http/http.dart' as http;

Future<Quote?> getData() async {
  var client = http.Client();
  var uri = Uri.parse('https://api.quotable.io/random');

  var response = await client.get(uri);

  if(response.statusCode == 200){
    Quote quote = quoteFromJson(response.body);

    return quote;
  }
  return null;
}