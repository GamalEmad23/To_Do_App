// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_local_variable, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:tadween/presentation/pages/loginPage.dart';

class Theredpage extends StatefulWidget {
  const Theredpage({super.key});

  @override
  State<Theredpage> createState() => _TheredpageState();
}

class _TheredpageState extends State<Theredpage> {
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
              child: Center(child: Image.asset("images/sharing.jpg")),),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Container(child: Center(
                    child: Text("    share your  \n        Notes" , style: TextStyle(
                      fontSize: 30 ,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[800]
                    ),),
                  ),)),
                ],
              ),



              SizedBox(height: size.height*.02,),


                Center(child: Container(child: Center(
                  child: Text("share the notes you completed and share  \n               it with friends and family" , style: TextStyle(
                  fontSize: 20 ,
                  color: Colors.blue
                                ),),
                ),)),


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
                       SizedBox(width: size.width*.01,),
                
                
                    Container(
                        height: size.height*.03,
                      width: size.width*.03,
                      decoration: BoxDecoration(
                      shape: BoxShape.circle ,
                      color: Colors.red
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
                  color: Colors.deepPurple[700],
                  onPressed: (){
                      
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => loginPaeg(),));
                          
                  } , child: Text("Get Started " , style: TextStyle(
                    color: Colors.white ,
                    fontSize: 20
                  ),),),

              ],),
          ],
        ),
      ),
    );
  }
}