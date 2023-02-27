// import 'package:admin_project/zfta.dart';
import 'package:flutter/material.dart';

import '../Api/database_helper.dart';

class box extends StatefulWidget {
  box(this.language, {super.key, required this.name});
  final String name;
  final int language;
  @override
  State<StatefulWidget> createState() {
    return boxState(language, name);
  }
}

class boxState extends State<box> {
  final String name;

  final int language;
  boxState(this.language, this.name);
  DatabaseHelper _databaseHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 206, 214, 226),

        // const  Color.fromARGB(255, 11, 35, 55),
        body: ListView(children: [
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: screenWidth / 4, vertical: screenHeight / 9),
              height: screenHeight / 5,
              child: Stack(alignment: Alignment.bottomCenter, children: [
                Container(
                  height: screenHeight / 3,
                  width: screenWidth / 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 11, 35, 55),
                      //Colors.white,
                      // const Color.fromARGB(255, 172, 219, 232),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 15),
                          blurRadius: 30,
                          color: Colors.black12,
                        )
                      ]),
                ),
                Positioned(
                    right: screenWidth / 10,
                    top: screenHeight / 19,
                    child: SizedBox(
                      height: screenHeight / 2,
                      width: screenWidth / 3,
                      child: Text(
                        name,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ))
              ]))
        ]));
  }
}
