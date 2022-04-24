import 'package:final_project/screens/signin_screen.dart';
import 'package:final_project/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 100, horizontal: 102),
              child: RichText(
                  text: const TextSpan(
                      style: TextStyle(decoration: TextDecoration.none),
                      children: <TextSpan>[
                    TextSpan(
                        text: '   Alimonio\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            color: Color.fromARGB(255, 40, 38, 38),
                            fontSize: 35.0,
                            shadows: [
                              Shadow(
                                  color: Colors.white,
                                  offset: Offset(2, 3),
                                  blurRadius: 15)
                            ],
                            letterSpacing: 1.5)),
                    TextSpan(
                        text: '    A streamlined recipe browsing experience',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Color.fromARGB(255, 40, 38, 38),
                          fontWeight: FontWeight.bold,
                        ))
                  ])),
            ),
            const SizedBox(
              height: 200,
              width: 250,
              child: Text(
                'Welcome to Alimonio!\n The app that lets your browse for any recipe or recommendations.\n Alimonio provides recipes to support various dietary restrictions such as Vegan, Keto, Vegetarian, etc. \n As well as providing you with suggestions to satisfy your cravings',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromARGB(255, 40, 38, 38),
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ),
            TextButton(
              child: const Text(
                'Get Started',
                style: TextStyle(
                    color: Color.fromARGB(255, 40, 38, 38),
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
              style: TextButton.styleFrom(
                  primary: Color.fromARGB(255, 40, 38, 38),
                  backgroundColor: Color.fromARGB(255, 255, 146, 22),
                  elevation: 5),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              },
            ),
          ],
        ));
  }
}
