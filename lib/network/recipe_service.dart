import 'package:flutter/material.dart';
import 'package:http/http.dart';

const String apiKey = 'c2e984fda22325d7a62452235f3bc789';
const String apiId = '16ae102f';
const String apiUrl = 'https://api.edamam.com/api/recipes/v2';

Future getData(String url) async {
  debugPrint('Calling URL: $url');
  final response = await get(Uri.parse(url));
  if (response.statusCode == 200) {
    debugPrint(response.body);
  } else {
    debugPrint(response.statusCode.toString());
  }
}

class RecipeService {
  Future<dynamic> getRecipe(String query, int from, int to) async {
    final recipeData = getData(
        '$apiUrl?app_id=$apiId&app_key=$apiKey&q=$query&type=public&from=$from&to=$to');
    return recipeData;
  }
}
