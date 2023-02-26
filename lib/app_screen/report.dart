
import 'package:admin_project/app_screen/final_report.dart';
import 'package:flutter/material.dart';

 List<String> list =<String>['Khartoum', 'Omdurman', 'Bahri'];
List<String> listt = <String>['accepted cards', 'wating cards', 'rejected cards'];

class report extends StatefulWidget{
   report(this.language, {super.key});
  final int language;
  @override
  State<StatefulWidget> createState() {

    

    return reportState(language);
}
}
class reportState extends State<report>{
    final int language;
 reportState (this.language);

  
DateTime startdate = DateTime.now();
DateTime enddate = DateTime.now();
String dropdownValue = list.first;
String dropdownValuee = listt.first;


  
  @override
  Widget build(BuildContext context) {
    
    
    double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 206, 214, 226),
       appBar:AppBar(
      backgroundColor:Color.fromARGB(255, 11, 35, 55),
       leading: Padding(
         padding: const EdgeInsets.all(5.0),
         child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.asset(
                'images/im.jpg.jpg',
                 )),
       ),
       elevation: 0,
        actions: [
          CircleAvatar(
            backgroundColor: Color.fromARGB(255, 135, 159, 196),
            child: ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Image.asset(
              'images/im.jpg.jpg',
          )),
          ),
         ] ),

      body: Center(
        child: ListView(
          children: [
           Align(
            alignment: language==1?Alignment.topLeft:Alignment.topRight,
             child: Text(language==1?' Report  ':'التقارير',
             style: TextStyle(
             fontSize: 50.0,
             color: Color.fromARGB(255, 11, 35, 55),
             fontWeight:FontWeight.bold, 
                     ),
                     ),
           ),
           Row(
             children: [
              Padding(
                padding: const EdgeInsets.only(top: 0,right: 120,left: 210),
                child: Text('Select center:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
                ),
              ),
               Padding(
                 padding: const EdgeInsets.all(20),
                 child: SizedBox(
                  width: 150,
                   child: DropdownButtonFormField  <String>(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:BorderSide(width: 2,color: Color.fromARGB(255, 11, 35, 55)) )
                    ),
                      value: dropdownValue,
                      icon: const Icon(
                        Icons.arrow_downward,
                        color: Color.fromARGB(255, 11, 35, 55),
                      ),
                      elevation: 16,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 11, 35, 55)),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>(
                          (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                 ),
               ),
             ],
           ),
           //////////////////////////////////////
           Row(
             children: [
              Padding(
                padding: const EdgeInsets.only(top: 0,right: 120,left: 210),
                child: Text('Select report type:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
                ),
              ),
               Padding(
                 padding: const EdgeInsets.all(10),
                 child: SizedBox(
                  width: 150,
                   child: DropdownButtonFormField  <String>(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:BorderSide(width: 2,color: Color.fromARGB(255, 11, 35, 55)) )
                    ),
                      value: dropdownValuee,
                      icon: const Icon(
                        Icons.arrow_downward,
                        color: Color.fromARGB(255, 11, 35, 55),
                      ),
                      elevation: 16,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 11, 35, 55)),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValuee = value!;
                        });
                      },
                      items: listt.map<DropdownMenuItem<String>>(
                          (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                 ),
               ),
             ],
           ),
           Row(
            children: [
              const Padding(padding: EdgeInsets.only(top: 0,right: 136,left: 210)),
            const Text('from: ',
            style: TextStyle(
             fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 11, 35, 55),
              fontSize: 30,
            ),),
            Padding(
             padding: const EdgeInsets.all(25.0),
              child: Text( "${enddate.year.toString()}-${enddate.month.toString().padLeft(2,'0')}-${enddate.day.toString().padLeft(2,'0')}",
              style: TextStyle(fontSize: 20),
),
            ),
           ElevatedButton(
                    style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                                const  Color.fromARGB(255, 11, 35, 55)),
                                 //  end coloring
                                // start bordering
                              shape:
                                 MaterialStateProperty.all<RoundedRectangleBorder>(
                                     RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )) ),
                 
                  child: const Text(
                    'select start date',
                    style:TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                   ),
                    ),
                  
                   onPressed: () async{
             DateTime?newdate =await  showDatePicker(
                 context: context,
                   initialDate: startdate, 
                  firstDate: DateTime(2023),
                    lastDate:  DateTime(2070),
                   );
                   if (newdate==null)return;
                   
                  setState(() {
                    startdate=newdate;
                   });
  } ),
            ],

           ),

     Row(children: [
           Padding(padding: EdgeInsets.only(top: 0,right: 136,left: 210)),
            const Text('TO: ',
            style: TextStyle(
             fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 11, 35, 55),
              fontSize: 30,
            ),),
            Padding(
             padding: const EdgeInsets.all(25.0),
              child: Text( "${enddate.year.toString()}-${enddate.month.toString().padLeft(2,'0')}-${enddate.day.toString().padLeft(2,'0')}",
              style: TextStyle(fontSize: 20),
),
            ),
           ElevatedButton(
                    style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                                const  Color.fromARGB(255, 11, 35, 55)),
                                 //  end coloring
                                // start bordering
                              shape:
                                 MaterialStateProperty.all<RoundedRectangleBorder>(
                                     RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )) ),
                 
                  child: const Text(
                    'select end date',
                    style:TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                   ),
                    ),
                  
                   onPressed: () async{
             DateTime?newdate =await  showDatePicker(
                 context: context,
                   initialDate: enddate, 
                  firstDate: DateTime(2023),
                    lastDate:  DateTime(2070),
                   );
                   if (newdate==null)return;
                   
                  setState(() {
                    enddate=newdate;
                   });
  } ),
      
      
     ]),
         Padding(
          padding:
              EdgeInsets.only(left: screenWidth / 2.3, right: screenWidth / 2.3,top: screenHeight/9),
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
                           return final_report(language);
                }));},
     )) ])));}}