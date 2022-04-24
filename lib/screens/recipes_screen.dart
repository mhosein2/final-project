import 'package:final_project/models/recipe_model.dart';
import 'package:final_project/models/search_models.dart';
import 'package:final_project/models/results.dart';
import 'package:final_project/screens/clicked_recipe.dart';
import 'package:final_project/screens/signin_screen.dart';
import 'package:final_project/services/services.dart';
import 'package:flutter/material.dart';

class RecipesScreen extends StatefulWidget {
  final Results search;

  RecipesScreen({required this.search});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  _buildRecipeCard(SearchRecipe recipe, int index) {
    return GestureDetector(
      onTap: () async {
        Recipe? clicked =
            await APIService.instance.fetchRecipe(recipe.id.toString());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ClickedScreen(clicked: clicked),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 220.0,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(recipe.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(30),
            padding: EdgeInsets.all(5),
            color: Colors.transparent,
            child: Column(
              children: <Widget>[
                Text(
                  recipe.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 40, 38, 38),
        title: Text('Recipes'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            },
            child: const Text("Logout"),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 1 + widget.search.results.length,
        itemBuilder: (BuildContext context, int index) {
          SearchRecipe recipe = widget.search.results[index];
          return _buildRecipeCard(recipe, index - 1);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Profile'),
        ],
      ),
    );
  }
}
