import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_cals/model/collect_data/collect_data.dart';

Future<CollectData> getNumberFactorial({required int number}) async {
  final response = await http.get(Uri.parse('http://numbersapi.com/$number?json'));
  final jsonData =  jsonDecode(response.body) as Map<String, dynamic>;
  final result = CollectData.fromJson(jsonData);
  return result;
}
