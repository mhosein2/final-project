import 'dart:convert';
import 'dart:io';
import 'package:final_project/models/results.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/recipe_model.dart';
import '../models/search_models.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
}

class APIService {
  APIService._instantiate();
  static final APIService instance = APIService._instantiate();

  final String BASEURL = "api.spoonacular.com";
  String? API_KEY = dotenv.env['API_KEY'];

  Future<Results> listRecipe({String? diet, required String query}) async {
    if (diet == 'None') diet = '';
    Map<String, String?> parameters = {
      'diet': diet,
      'query': query,
      'apiKey': API_KEY,
    };

    Uri uri = Uri.https(BASEURL, '/recipes/complexSearch', parameters);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);

      Map<String, dynamic> data = json.decode(response.body);

      Results searchRecipe = Results.fromMap(data);
      return searchRecipe;
    } catch (err) {
      throw err.toString();
    }
  }

  Future<Recipe?> fetchRecipe(String id) async {
    Map<String, String?> parameters = {
      'includeNutrition': 'false',
      'apiKey': API_KEY,
    };

    Uri uri = Uri.https(BASEURL, '/recipes/$id/information', parameters);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);

      Map<String, dynamic> data = json.decode(response.body);

      Recipe recipe = Recipe.fromMap(data);
      return recipe;
    } catch (err) {
      throw err.toString();
    }
  }
}
