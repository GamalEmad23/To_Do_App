// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, body_might_complete_normally_nullable, use_build_context_synchronously, avoid_single_cascade_in_expression_statements, avoid_print, unused_local_variable, curly_braces_in_flow_control_structures

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tadween/presentation/pages/loginPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  GlobalKey<FormState> global = GlobalKey();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obsecret =false;
  bool agree= false;
   
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Scaffold(  
      body: Container(
        padding: EdgeInsets.only(left: size.width*.035),
        color: Colors.blueGrey[50],
        child: Form(
          key: global,
          child: ListView(
          children: [
              Center(
                  child: Container(
                    alignment:Alignment.topLeft,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Container(
                    alignment:Alignment.topLeft,
                    child: Text(
                      "Creat Your Account",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),

                  SizedBox(height: size.height*.025,),


                     Container(
                      margin: EdgeInsets.only(left: size.width*.055),
                    alignment:Alignment.topLeft,
                    child: Text(
                      "Personal Details",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),

                  SizedBox(height: size.height*.015,),
        
        
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: size.width*.025),
                      alignment: Alignment.center,
                      height: size.height*.055,
                      color: Colors.white,
                      child: Text("Name" , style: TextStyle(
                        fontSize: 18
                      ),),),
                    Container(
                      width: size.width*.75,
                      padding: EdgeInsets.symmetric(horizontal:size.width*.023),
                      child: TextFormField(
                        validator: (value) {
                           if(value!.isEmpty)
                          {
                            return "This field can't be empity ";
                          }
                    
                        },
                         
                        controller: username,
                         decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                            
                            
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          )
                            
                         ),
                      ),
                    ),
                  ],
                ),


                   SizedBox(height: size.height*.005,),
        
        
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: size.width*.025),
                      alignment: Alignment.center,
                      height: size.height*.055,
                      color: Colors.white,
                      child: Text("Phone" , style: TextStyle(
                        fontSize: 18
                      ),),),
                    Container(
                      width: size.width*.75,
                      padding: EdgeInsets.symmetric(horizontal:size.width*.023),
                      child: TextFormField(
                        validator: (value) {
                           if(value!.isEmpty)
                          {
                            return "This field can't be empity ";
                          }
                    
                        },
                         
                        controller: phone,
                         decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                            
                            
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          )
                            
                         ),
                      ),
                    ),
                  ],
                ),







                
        
        
                SizedBox(height: size.height*.025),

                
                     Container(
                      margin: EdgeInsets.only(left: size.width*.055),
                    alignment:Alignment.topLeft,
                    child: Text(
                      "User",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),

                  SizedBox(height: size.height*.015,),

        
                Row(
                  children: [

                     Container(
                      padding: EdgeInsets.symmetric(horizontal: size.width*.025),
                      alignment: Alignment.center,
                      height: size.height*.055,
                      color: Colors.white,
                      child: Text("Email" , style: TextStyle(
                        fontSize: 18
                      ),),),


                    Container(
                       width: size.width*.75,
                      padding: EdgeInsets.symmetric(horizontal:size.width*.023),
                      child: TextFormField(
                        validator: (value) {
                           if(value!.isEmpty)
                          {
                            return "This field can't be empity ";
                          }
                        },
                         
                        controller: email,
                         decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                            
                            
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          )
                            
                         ),
                      ),
                    ),
                  ],
                ),
        
        
                                     SizedBox(height: size.height*.005,),

        
                Row(
                  children: [

               
                     Container(
                      padding: EdgeInsets.symmetric(horizontal: size.width*.025),
                      alignment: Alignment.center,
                      height: size.height*.055,
                      color: Colors.white,
                      child: Text("Password" , style: TextStyle(
                        fontSize: 18
                      ),),),
                     
                  


                    Container(
                      width: size.width*.67,

                      padding: EdgeInsets.symmetric(horizontal:size.width*.023),
                      child: TextFormField(
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                            return "This field can't be empity ";
                          }
                          if(value.length<5)
                          {
                          return "Password can't be less than 5 ";
                          }
                         
                         },
                        controller: password,
                        obscureText: obsecret ,
                         decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          suffixIcon: IconButton(onPressed: (){
                            setState(() {
                              obsecret = !obsecret;
                            });
                          }, icon:obsecret==false? Icon(Icons.remove_red_eye_rounded):Icon(Icons.remove_red_eye_outlined)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                            
                            
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          )
                            
                         ),
                      ),
                    ),
                  ],
                ),



                
                SizedBox(height: size.height*.025),

                
                     Container(
                      margin: EdgeInsets.only(left: size.width*.055),
                    alignment:Alignment.topLeft,
                    child: Text(
                      "Terms & Conditions",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),

                SizedBox(height: size.height*.025),


                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: size.width*.025),
                    child: Row
                    (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      
                       Container(
                        padding: EdgeInsets.symmetric(horizontal: size.width*.025),
                        alignment: Alignment.center,
                        height: size.height*.055,
                        color: Colors.white,
                        child: Text("you Agree" , style: TextStyle(
                          fontSize: 18
                        ),),),
                    
                    
                      Switch(value: agree, onChanged: (value) {
                        setState(() {
                                               agree = value;
                        });
                      },)
                    ],),
                  ),


                
                SizedBox(height: size.height*.025,),



        
        
                Container(
                  width: size.width*.99,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),

                  ),
                  child: Center(
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      color:const Color.fromARGB(255, 22, 41, 152) ,
                      onPressed: ()async{
                          
                           if(global.currentState!.validate())
                           try {
                              final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                email: email.text,
                                password: password.text,
                              );
                              FirebaseAuth.instance.currentUser!.sendEmailVerification();
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => loginPaeg(), ));
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                print('The password provided is too weak.');
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.rightSlide,
                                  title: 'weak-password',
                                  desc: 'The password provided is too weak.',
                                 
                                  )..show();
                            
                            
                              } else if (e.code == 'email-already-in-use') {
                                print('The account already exists for that email.');
                                 AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.rightSlide,
                                  title: 'email-already-in-use',
                                  desc: 'The account already exists for that email.',
                                 
                                  )..show();
                              }
                            } catch (e) {
                              print(e);
                            }
                         
                            
                      } , child: Text("Sign Up " , style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),),),
                  ),
                ),



                SizedBox(height: size.height*.025,),

        
        
        
                 Center(
                   child: Container(
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text("Have an account ? ", style: TextStyle(
                      fontSize: 20
                    ),),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginPaeg(),));
                        },
                        child: Text("Login", style: TextStyle(
                      color: const Color.fromARGB(255, 123, 6, 43),
                      fontSize: 20
                    ),))
                                   ],),
                   ),
                 )
          ],
        )),
      ),
    );
  }
}