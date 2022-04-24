import 'package:final_project/models/results.dart';
import 'package:final_project/screens/recipes_screen.dart';
import 'package:final_project/services/services.dart';
import 'package:flutter/material.dart';

import '../models/search_models.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController myController = TextEditingController();

  List<String> _diets = [
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
  String _query = 'pasta';

  void _searchRecipes() async {
    Results search =
        await APIService.instance.listRecipe(diet: _diet, query: _query);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipesScreen(search: search),
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
      style: TextStyle(
        decorationColor: Colors.white,
        color: Colors.white,
      ),
      autofocus: false,
      onSaved: (value) {},
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 5, 20, 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          hintStyle: TextStyle(color: Colors.white)),
    );

    return Scaffold(
      body: Container(
          decoration: BoxDecoration(color: Colors.blueGrey),
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.9),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Alimonio',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      letterSpacing: 2.0,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
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
                                  style: TextStyle(
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
                  Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    queryField,
                  ]),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextButton(
                    child: Text(
                      'Search Recipes',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    onPressed: _searchRecipes,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
