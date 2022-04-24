import 'package:final_project/models/search_models.dart';

class Results {
  final List<SearchRecipe> results;

  Results({
    required this.results,
  });

  factory Results.fromMap(Map<String, dynamic> map) {
    List<SearchRecipe> results = [];
    map['results']
        .forEach((resultMap) => results.add(SearchRecipe.fromMap(resultMap)));
    return Results(results: results);
  }
}
