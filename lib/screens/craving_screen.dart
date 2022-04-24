import 'package:final_project/models/productresults.dart';
import 'package:final_project/models/search_models.dart';
import 'package:final_project/screens/cravings_search.dart';
import 'package:final_project/screens/search.dart';
import 'package:final_project/screens/signin_screen.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final ProductResults search;

  const ProductScreen({Key? key, required this.search}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

// This is when I started to try to change the cravings results to a list instead of a box
class _ProductScreenState extends State<ProductScreen> {
  _buildProductCard(SearchRecipe recipe, int index) {
    return Stack(
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
        itemCount: widget.search.prodResults.length,
        itemBuilder: (BuildContext context, int index) {
          SearchRecipe recipe = widget.search.prodResults[index];
          return _buildProductCard(recipe, index - 1);
        },
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 40, 38, 38),
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 1),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: Container(
                child: Text(
                  'Alimonio',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Color.fromARGB(255, 40, 38, 38)),
                ),
                alignment: Alignment.bottomLeft,
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                title: Text(
                  'Recipes',
                  style: TextStyle(color: Color.fromARGB(255, 255, 146, 22)),
                ),
                trailing: Icon(
                  Icons.search_outlined,
                  color: Color.fromARGB(255, 255, 146, 22),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                title: Text(
                  'Cravings',
                  style: TextStyle(color: Color.fromARGB(255, 255, 146, 22)),
                ),
                trailing:
                    Icon(Icons.cake, color: Color.fromARGB(255, 255, 146, 22)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProductSearch()));
                },
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(color: Color.fromARGB(255, 255, 146, 22)),
                ),
                trailing: Icon(Icons.logout,
                    color: Color.fromARGB(255, 255, 146, 22)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
