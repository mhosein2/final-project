// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final _key = GlobalKey<FormState>();
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text('Search Page'),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
//         unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Chat'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.account_box), label: 'Profile'),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Form(
//                 key: _key,
//                 autovalidateMode: AutovalidateMode.always,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.search),
//                         hintText: 'Enter Search',
//                         border: OutlineInputBorder(),
//                         filled: true,
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Search empty';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                       width: double.infinity,
//                       child: TextButton(
//                         style: TextButton.styleFrom(
//                             primary: Colors.black,
//                             backgroundColor: Colors.black),
//                         onPressed: () {},
//                         child: Text(
//                           'Search',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
