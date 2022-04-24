import 'package:final_project/models/productresults.dart';
import 'package:final_project/screens/craving_screen.dart';
import 'package:final_project/screens/search.dart';
import 'package:final_project/screens/signin_screen.dart';
import 'package:final_project/services/services.dart';
import 'package:flutter/material.dart';

class ProductSearch extends StatefulWidget {
  const ProductSearch({Key? key}) : super(key: key);

  @override
  State<ProductSearch> createState() => _ProductSearchState();
}

class _ProductSearchState extends State<ProductSearch> {
  TextEditingController myController = TextEditingController();

  String _query = '';

  void _searchProducts() async {
    ProductResults search =
        await APIService.instance.listProduct(query: _query);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductScreen(search: search),
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
      decoration: const InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.blueGrey)),
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
                            text: 'SATISFY ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                color: Colors.blueGrey,
                                fontSize: 25.0,
                                letterSpacing: 1.5)),
                        TextSpan(
                            text: 'cravings',
                            style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5))
                      ])),
                  const Text('\nEnter a keyword(s)',
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
                    onPressed: _searchProducts,
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                alignment: Alignment.bottomLeft,
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                title: Text('Search'),
                trailing: Icon(Icons.search_outlined),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                title: Text('Cravings'),
                trailing: Icon(Icons.cake),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProductSearch()));
                },
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                title: Text('Logout'),
                trailing: Icon(Icons.logout),
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
