//import 'package:dd/cc.dart';
import 'package:admin_project/app_screen/box.dart';
import 'package:flutter/material.dart';

class conf extends StatefulWidget {
  conf(this.language, {super.key});
   final int language;
  @override
  State<StatefulWidget> createState() {
    return confState(language);
  }
}

class confState extends State<conf> {
   final int language;
 confState (this.language);
  @override
  Widget build(BuildContext context) {
    var boxx = box(language, name: '',);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 214, 226),
        body: ListView(children: [
      Padding(
        padding: EdgeInsets.only(
            left: screenWidth / 10,
            right: screenWidth / 10,
            top: screenHeight / 10),
        child: Align(
          alignment: language==1?Alignment.topLeft:Alignment.topRight,
          child: Text(language==1?
            '  Confirmation':"التأكيد",
            style:  TextStyle(
              fontSize: 50.0,
              color: Color.fromARGB(255, 11, 35, 55),
              fontWeight: FontWeight.bold,
              
            ),
          ),
        ),
      ),
      Padding(
          padding: EdgeInsets.only(
              left: screenWidth / 6,
              right: screenWidth / 6,
              top: screenHeight / 10),
          child: SizedBox(
              height: screenHeight / 7,
              width: screenWidth,
              child: TextFormField(
                decoration:  InputDecoration(
                  hintText:language==1? " Enter process number":"أدخل رقم العمليه",
                  hintTextDirection:language==1? TextDirection.ltr:TextDirection.rtl,
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 11, 35, 55)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 11, 35, 55)),
                  ),
                ),
              ))),
      Padding(
          padding:
              EdgeInsets.only(left: screenWidth / 3, right: screenWidth / 3),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 11, 35, 55)),
                  //end coloring
                  //start bordering
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ))),
              child:  Text(language==1?
                'ok':'تم',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {})),
      Container(
        height: screenHeight,
        child:boxx ,
      )
    ]));
  }}