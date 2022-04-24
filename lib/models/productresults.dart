import 'package:final_project/models/search_models.dart';

class ProductResults {
  final List<SearchRecipe> prodResults;

  ProductResults({
    required this.prodResults,
  });

  factory ProductResults.fromMap(Map<String, dynamic> map) {
    List<SearchRecipe> prodResults = [];
    map['products'].forEach(
        (resultMap) => prodResults.add(SearchRecipe.fromMap(resultMap)));
    return ProductResults(prodResults: prodResults);
  }
}
