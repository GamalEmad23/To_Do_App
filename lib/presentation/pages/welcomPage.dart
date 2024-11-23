// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:tadween/presentation/pages/homePageToDo.dart';
import 'package:tadween/presentation/pages/homepage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(title: Text( "Tadween" , style: TextStyle(
        fontFamily: "Display",
        color: Colors.black,
        fontSize: 35
      ),),
      centerTitle: true,
      ),

      body: Container(
        color: Colors.indigo[900],
        height:size.height ,
        width: size.width,
        child: ListView(children: [
          SizedBox(height: size.height*.09,),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.all(size.width*.01),
              width: size.width*.25,
              height: size.height*.055,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue[400]
              ),
              child: Center(child: Text("Notes" , style: TextStyle(
                fontSize: 20
              ),)),),


              Container(
              padding: EdgeInsets.all(size.width*.01),
              width: size.width*.25,
              height: size.height*.055,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue[400]
              ),
              child: Center(child: Text("Notes" , style: TextStyle(
                fontSize: 20
              ),)),),

           


          ],
         ),

          SizedBox(height: size.height*.05,),


            Container(child: ClipRRect( borderRadius: BorderRadius.circular(30), child: Image.asset("images/WhatsApp Image 2024-10-29 at 18.09.26_dc1074d5.jpg")),),

          SizedBox(height: size.height*.05,),
         

         Container(
          alignment: Alignment.center,
           child: Text("Creat Your Notes and Lists" , style: TextStyle(
                   fontFamily: "Display",
                   color: const Color.fromARGB(255, 255, 245, 245),
                   fontSize:20
                 ),  ),
         ) ,


          SizedBox(height: size.height*.05,),
         
             


           Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(),));
              },
              child: Container(
                padding: EdgeInsets.all(size.width*.01),
                width: size.width*.45,
                height: size.height*.055,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[400]
                ),
                child: Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.add , color: Colors.white,),
                    Text("New Notes" , style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),),
                  ],
                )),),
            ),


              InkWell(
                 onTap: () async {
                  loading = true;
              await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePageToDo(),));
              },
                child: Container(
                padding: EdgeInsets.all(size.width*.01),
                width: size.width*.45,
                height: size.height*.055,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[400]
                ),
                child: Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.add , color: Colors.white,),
                    Text("New List" , style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),),
                  ],
                )),),
              ),

           


          ],
         ),

      ],),),
    );
  }
}