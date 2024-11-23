// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_local_variable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:tadween/page/secondpage.dart';

class Homepage2 extends StatefulWidget {
  const Homepage2({super.key});

  @override
  State<Homepage2> createState() => _Homepage2State();
}

class _Homepage2State extends State<Homepage2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              width: size.width*.5,
              height: size.height*.45,
              child: Center(child: Image.asset("images/to do.jpg")),),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                width: size.width*.77,
                child: Center(
                  child: Text("It is more easy " , style: TextStyle(
                  fontSize: 30 ,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[800]
                                ),),
                ),),

               Container(child: Center(
                 child: Text("To make your to do list" , style: TextStyle(
                  fontSize: 30 ,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[800]
                               ),),
               ),),



              SizedBox(height: size.height*.02,),


                 Container(
                  width: size.width*.88,
                  child: Center(
                    child: Text(" Write your list is  very comptatable \n  without any annoysing ads" , style: TextStyle(
                                    fontSize: 20 ,
                                    color: Colors.blue
                                  ),),
                  ),),
              ],),


              SizedBox(height: size.height*.02,),

              Center(
                child: Container(
                  width: size.width*.12,
                  height: size.height*.05,
                  child: Row(
                  
                  children: [
                    Container(
                        height: size.height*.03,
                      width: size.width*.03,
                      decoration: BoxDecoration(
                      shape: BoxShape.circle ,
                      color: Colors.red
                    ),),
                       SizedBox(width: size.width*.01,),
                
                    Container(
                      height: size.height*.03,
                      width: size.width*.03,
                      decoration: BoxDecoration(
                      shape: BoxShape.circle ,
                      color: Colors.grey
                    ),),
                       SizedBox(width: size.width*.01,),
                
                
                    Container(
                        height: size.height*.03,
                      width: size.width*.03,
                      decoration: BoxDecoration(
                      shape: BoxShape.circle ,
                      color: Colors.grey
                    ),),
                
                
                    
                  ],
                ),),
              ),


              SizedBox(height: size.height*.07,),




              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                  height: 50,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    onPressed: (){
                    
                    } , child: Text("skip" , style: TextStyle(
                    color: Colors.blue ,
                    fontSize: 20
                  ),),),
              


                MaterialButton(
                  height: 50,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  color: Colors.deepPurple[700],
                  onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Secondpage(),));
                  } , child: Icon(Icons.arrow_right_alt_outlined , size: 50,color: Colors.white,),),

              ],),
          ],
        ),
      ),
    );
  }
}