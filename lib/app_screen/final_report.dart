import 'package:admin_project/app_screen/admin_board.dart';
import 'package:flutter/material.dart';

class final_report extends StatefulWidget{
   final_report(this.language, {super.key});
 final int language;
  @override
  State<StatefulWidget> createState() {
    return final_reportState(language);
}
}
class final_reportState extends State< final_report>{
    final int language;
 final_reportState (this.language);
  @override
  Widget build(BuildContext context) {
  
    double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 206, 214, 226),
      body: ListView(
        children: [
         Row(
           children: const [
             Padding(
                 padding: EdgeInsets.only(top:30,left: 20),
                 child: Text(' Number of current ID:  ',
                  style: TextStyle(
                  fontSize: 50.0,
                  color: Color.fromARGB(255, 11, 35, 55),
                  fontWeight:FontWeight.bold, 
                       ),
                       ),
               ),
             Padding(
               padding: EdgeInsets.only(top:30,left: 0),
               child: Text(' 150  ',
                style: TextStyle(
                fontSize: 50.0,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight:FontWeight.bold, 
                     ),
                     ),
             ),


           ],
         ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top:80.0),
                child: DataTable(
                          headingRowColor:
                              MaterialStateColor.resolveWith((states) => const Color.fromARGB(255, 11, 35, 55)),
                          dataRowColor:
                              MaterialStateColor.resolveWith((states) => Color.fromARGB(255, 255, 255, 255)),
                          columns: [
                            DataColumn(
                              label: Text("Name",
                              style:TextStyle(
                                 color: Colors.white,
                                 fontSize: 25,
                                 fontWeight: FontWeight.bold,
                ),
                              ),

                            ),
                            DataColumn(
                              label: Text("date",
                              style:TextStyle(
                                 color: Colors.white,
                                 fontSize: 25,
                                 fontWeight: FontWeight.bold,
                ),
                              ),
                            ),
                          ],
                          rows: [
                            DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    "Mai salah aldeen ali",

                                  ),
                                ),
                                DataCell(
                                  Text("12-1-2023",
                                 
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
              ),
            ),
          ),
         
            
          
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 11, 35, 55)),
                        //end coloring
                        //start bordering
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ))),
                    child:  Text(language==1?
                      'ok':'تم',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context){
                                 return board(language);
                      }));},
                   ),
              ),
            ),
          )
      ]));}}
        