// ignore_for_file: avoid_unnecessary_containers, avoid_single_cascade_in_expression_statements, body_might_complete_normally_nullable, sized_box_for_whitespace, prefer_const_constructors, unused_local_variable, use_build_context_synchronously, avoid_print, avoid_returning_null_for_void, curly_braces_in_flow_control_structures, unused_import, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tadween/presentation/pages/homepage.dart';
import 'package:tadween/presentation/pages/registerPage.dart';
import 'package:tadween/presentation/pages/welcomPage.dart';

class loginPaeg extends StatefulWidget {
  const loginPaeg({super.key});

  @override
  State<loginPaeg> createState() => _loginPaegState();
}

class _loginPaegState extends State<loginPaeg> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> global = GlobalKey();
  bool obsecret = false;


Future signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
   await FirebaseAuth.instance.signInWithCredential(credential);
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>WelcomePage(),));
}

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
                      "Log In",
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
                      "You Have an Account",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),

                  SizedBox(height: size.height*.015,),


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
                      child: Text("Email" , style: TextStyle(
                        fontSize: 18
                      ),),),
                

                    Container(
                      width: size.width*.75,
                      padding: EdgeInsets.symmetric(horizontal: size.width * .023),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can't be empity ";
                          }
                        
                        },
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
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
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * .007),
        
                
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
                      padding: EdgeInsets.symmetric(horizontal: size.width * .023 , vertical: size.width*.012),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can't be empity ";
                          }
                          if (value.length < 5) {
                            return "Password can't be less than 5 ";
                          }
                        },
                        controller: password,
                        keyboardType: TextInputType.multiline,
                        obscureText: obsecret,
                        decoration: InputDecoration(
                            filled: true,              
                                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obsecret = !obsecret;
                                  });
                                },
                               icon:obsecret==false? Icon(Icons.remove_red_eye_rounded):Icon(Icons.remove_red_eye_outlined)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                  ],
                ),


                
                SizedBox(
                  height: size.height * .01,
                ),

                Container(
                  padding: EdgeInsets.only(right: size.width*.035),
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: ()async {
                     await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
                    },
                    child: Text("Forget Password ?" , style: TextStyle(
                      color: Colors.red,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),),
                  ),),


                Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * .025),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: MaterialButton(
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        color:const Color.fromARGB(255, 22, 41, 152) ,
                      onPressed: () async {
                        if (global.currentState!.validate())
                          try {
                            final credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: email.text,
                              password: password.text,
                            );
                            if (FirebaseAuth.instance.currentUser!.emailVerified) {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => WelcomePage(),));
                            } else {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.info,
                                animType: AnimType.rightSlide,
                                title: 'Verify',
                                desc: 'check your gmail to Verify your email ',
                              )..show();
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.info,
                                animType: AnimType.rightSlide,
                                title: 'user-not-found',
                                desc: 'No user found for that email.',
                              )..show();
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.info,
                                animType: AnimType.rightSlide,
                                title: 'wrong-password',
                                desc: 'Wrong password provided for that user.',
                              )..show();
                            }
                          }
                      },
                      child: Text("login now ", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),),
                    ),
                  ),
                ),
        
        
        
                SizedBox(
                  height: size.height * .026,
                ),
        
        
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.black,
                      height: size.height * .001,
                      width: size.width * .26,
                    ),
                    Text("Or login with "),
                    Container(
                      color: Colors.black,
                      height: size.height * .001,
                      width: size.width * .26,
                    ),
                  ],
                ),
        
        
        
                SizedBox(
                  height: size.height * .026,
                ),
        
        
        
        
                GestureDetector(
                  onTap: () {
                    signInWithGoogle();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * .025),
                    width: size.width * .95,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: size.height * .070,
                          child: Image.asset("images/google - Copy.png"),
                        ),
                        Text(
                          "Login With Google",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
        
        
        
                SizedBox(
                  height: size.height * .026,
                ),
        
        
        
                Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * .025),
                  width: size.width * .95,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: size.height * .070,
                        child: Image.asset("images/social_13051733.png"),
                      ),
                      Text(
                        "Login With Facebook",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
        
        
                 SizedBox(
                  height: size.height * .026,
                ),
        
        
        
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an account ? ",
                      style: TextStyle(fontSize: 20),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ));
                        },
                        child: Text(
                          "Register",
                          style:
                              TextStyle(   
                                fontSize: 20,       
                          color: const Color.fromARGB(255, 123, 6, 43),
),
                        ))
                  ],
                )
              ],
            )),
      ),
    );
  }
}
