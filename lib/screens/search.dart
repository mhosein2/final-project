import 'package:final_project/models/results.dart';
import 'package:final_project/screens/recipes_screen.dart';
import 'package:final_project/screens/signin_screen.dart';
import 'package:final_project/services/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController myController = TextEditingController();

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
          contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          hintStyle: const TextStyle(color: Colors.blueGrey)),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 40, 38, 38),
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
                            text: 'ALI',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                color: Colors.black,
                                fontSize: 25.0,
                                letterSpacing: 1.5)),
                        TextSpan(
                            text: 'monio',
                            style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5))
                      ])),
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
                  Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    queryField,
                  ]),
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
                      backgroundColor: Colors.blueGrey,
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
