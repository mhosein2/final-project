import 'dart:convert';
import 'dart:io';
import 'package:final_project/models/productresults.dart';
import 'package:final_project/models/searchresults.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/recipe_model.dart';

class APIService {
  APIService._instantiate();
  static final APIService instance = APIService._instantiate();

  final String BASEURL = "api.spoonacular.com";
  String API_KEY = dotenv.get("API_KEY", fallback: "");

  Future<Results> listRecipe({String? diet, String? query}) async {
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

  Future<ProductResults> listProduct({required String? query}) async {
    Map<String, String?> parameters = {
      'number': '5',
      'query': query,
      'apiKey': API_KEY,
    };

    Uri uri = Uri.https(BASEURL, '/food/products/search', parameters);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);

      Map<String, dynamic> data = json.decode(response.body);

      ProductResults searchProduct = ProductResults.fromMap(data);
      return searchProduct;
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

  Future<Recipe?> fetchProduct(String id) async {
    Map<String, String?> parameters = {
      'includeNutrition': 'false',
      'apiKey': API_KEY,
    };

    Uri uri = Uri.https(BASEURL, '/food/products/$id', parameters);

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
