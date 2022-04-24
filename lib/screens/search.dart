// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:final_project/models/searchresults.dart';
import 'package:final_project/screens/cravings_search.dart';
import 'package:final_project/screens/homepage.dart';
import 'package:final_project/screens/recipes_screen.dart';
import 'package:final_project/screens/signin_screen.dart';
import 'package:final_project/services/services.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController myController = TextEditingController();
  int currentIndex = 0;

  final List<Widget> _children = [SearchPage(), ProductSearch()];

  _onTap() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => _children[currentIndex]));
  }

  void tabSelect(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<String> _diets = [
    'None',
    'Gluten Free',
    'Ketogenic',
    'Lacto-Vegetarian',
    'Ovo-Vegetarian',
    'Vegan',
    'Pescatarian',
    'Paleo',
    'Primal',
    'Whole30',
  ];

  String _diet = 'None';
  String _query = '';

  void _searchRecipes() async {
    Results search =
        await APIService.instance.listRecipe(diet: _diet, query: _query);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RecipesScreen(search: search),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final queryField = TextFormField(
      onChanged: ((value) {
        _query = (myController.text);
      }),
      controller: myController,
      style: const TextStyle(
        decorationColor: Colors.blueGrey,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      autofocus: false,
      onSaved: (value) {},
      decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: const TextStyle(color: Colors.blueGrey)),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 40, 38, 38),
      ),
      body: Container(
          decoration: const BoxDecoration(color: Colors.blueGrey),
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.9),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RichText(
                      text: const TextSpan(
                          style: TextStyle(decoration: TextDecoration.none),
                          children: <TextSpan>[
                        TextSpan(
                            text: 'SEARCH ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                color: Colors.blueGrey,
                                fontSize: 25.0,
                                letterSpacing: 1.5)),
                        TextSpan(
                            text: 'recipes\n',
                            style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5))
                      ])),
                  Text(
                    'Enter a diet',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                            child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            items: _diets.map((String priority) {
                              return DropdownMenuItem(
                                value: priority,
                                child: Text(
                                  priority,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 15.0),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _diet = value.toString();
                              });
                            },
                            value: _diet,
                          ),
                        ))
                      ],
                    ),
                  ),
                  Text('\nEnter a keyword(s)',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 10)),
                  Material(
                    elevation: 4,
                    shadowColor: Color.fromARGB(255, 255, 146, 22),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          queryField,
                        ]),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextButton(
                    child: const Text(
                      'Search Recipes',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color.fromARGB(255, 255, 146, 22),
                    ),
                    onPressed: _searchRecipes,
                  ),
                ],
              ),
            ),
          )),
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
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
