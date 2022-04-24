class SearchRecipe {
  final int id;
  final String title;
  final String imageUrl;

  SearchRecipe({required this.id, required this.title, required this.imageUrl});

  factory SearchRecipe.fromMap(Map<String, dynamic> map) {
    return SearchRecipe(
      id: map['id'],
      title: map['title'],
      imageUrl: 'https://spoonacular.com/recipeImages/' + map['image'],
    );
  }
}
