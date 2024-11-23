// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_build_context_synchronously, camel_case_types, unused_element, avoid_print, unused_field, prefer_const_literals_to_create_immutables, avoid_single_cascade_in_expression_statements

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tadween/presentation/pages/addstat.dart';
import 'package:tadween/presentation/pages/loginPage.dart';
import 'package:tadween/presentation/pages/welcomPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = true;
  // List<String> items = [
  //   "Red","Blue","Green","Yellow"
  // ];
  //  String? colorl = "Blue";
  List<QueryDocumentSnapshot> data = [];
  getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('categories').where("id" , isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
    data.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  void initState() {
      Timer( Duration(milliseconds: 1000),() {
      setState(() {
        loading=false;
      });
    },);
    getData();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor:  Color.fromARGB(255, 22, 41, 152),
        onPressed: (){
          
        showModalBottomSheet( enableDrag: true , useRootNavigator: true, 
        useSafeArea: true,
        // isScrollControlled: true,
        // scrollControlDisabledMaxHeightRatio: size.height*.5,
        sheetAnimationStyle: AnimationStyle(curve: Curves.bounceIn),
        clipBehavior: Clip.none,
        constraints: BoxConstraints(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),context: context, builder: (context) {
          return AddCatergories();
        },);
         
      },child:  Icon(Icons.add , color: Colors.white,),
      ),
         
    
      drawer: Drawer(child: Row(
        children: [
          SizedBox(height: size.height*.5),
          Container(
            height: size.height*.025,
            color: Colors.red,
            child: MaterialButton(onPressed: ()async{
              await FirebaseAuth.instance.signOut();
              GoogleSignIn googleSignIn = GoogleSignIn();     
              googleSignIn.disconnect();

                     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => loginPaeg(),));

                     },
                     child: Text("log out"),
                    ),
          ),
        ],
      ),),
      appBar: AppBar(backgroundColor:Colors.blueGrey[50] ,
      actions: [MaterialButton(onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => WelcomePage(),));
      },
      child: Text("Back" , style: TextStyle(
        fontSize: 20
      ),),
      )],
      title: Text("Notes" , style: TextStyle(
        fontFamily: "Display",
        fontSize: 35
      ),),
      centerTitle: true,
      ),
      body: LiquidPullToRefresh(
        
        onRefresh: () async{ 
         },
         borderWidth: 2,
         animSpeedFactor: 5,
         backgroundColor: const Color.fromARGB(255, 139, 9, 46),
         color: Colors.blue,
        child: OverflowBar(
          children: [
            SafeArea(
                  child: Container(
                      decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                  
                      ),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, mainAxisExtent: size.height*.5 , crossAxisSpacing: size.width),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Skeletonizer(
                            enabled: loading,
                            child: Card(
                                // elevation: 30,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                shadowColor: Colors.black,
                                // color: colorl =="Red" ? Colors.red: colorl== "Blue" ? Colors.blue : colorl== "Green" ? Colors.green : colorl == "Yellow" ? Colors.amber: Colors.white,
                                color: Colors.indigo[900],
                                surfaceTintColor: const Color.fromARGB(255, 41, 96, 64),
                                margin: EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                   
                                        
                                        
                                        
                                        
                                    Container(
                                      alignment: Alignment.topRight,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                        
                                          Column(children: [
                                            
                                            Container(
                                        padding: EdgeInsets.all(30),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                child: Text("${data[index]['title']}",
                                                    style: TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ))),
                                        
                                        
                                        
                                                    
                                        
                                        
                                                    
                                         
                                          ],
                                        )),
                                        
                                        
                                        
                                        
                                             Container(
                                        // padding: EdgeInsets.all(30),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                child: Text("${data[index]['content']}",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 21,
                                                      // fontWeight: FontWeight.bold,
                                                    ))),
                                        
                                        
                                        
                                                    
                                        
                                        
                                                    
                                         
                                          ],
                                        )),
                                          ],),
                                        
                                     
                                        
                                             
                                        
                                        
                                          PopupMenuButton(
                                            iconColor: Colors.white,
                                             itemBuilder: (context) => [
                                            PopupMenuItem(child: Column(
                                              children: [
                                                  Row(
                                                    children: [
                                                      IconButton(onPressed: ()async{
                                                                                          await FirebaseFirestore.instance
                                                                                            .collection('categories')
                                                                                            .doc(data[index].id)
                                                                                            .delete();
                                                                                        setState(() {});
                                                                                        Navigator.of(context).
                                                                                  pushReplacement(MaterialPageRoute(builder: (context) => HomePage(),));
                                                                                        }, icon: Icon(Icons.delete)),
                                        
                                                                                           Text("Delet")
                                                    ],
                                                  ),
                                        
                                            Row(
                                              children: [
                                                IconButton(onPressed: () async{
                                                                                 
                                                                                   }, icon: Icon(Icons.edit)),
                                        
                                                                                   Text("Edit")
                                              ],
                                            ),
                                        
                                        
                                    //          Row(
                                    //           children: [
                                    //             IconButton(onPressed: (){
                                    //                               AwesomeDialog(
                                    // context: context,
                                    // dialogType: DialogType.info,
                                    // animType: AnimType.rightSlide,
                                    // title: 'user-not-found',
                                    // desc: 'No user found for that email.',
                                    // body: Column(children: [
                                              
                                              
                                            //                            RadioListTile(
                                            //   title: Text("Red"),
                                            //   value: "red",
                                            //    groupValue: colorl,
                                            //    onChanged: (value) {
                                            // setState(() {
                                            //   colorl=value;
                                            // });
                                            // },),
                                            
                                        
                                            //   RadioListTile(
                                            //   title: Text("Blue"),
                                            //   value: "Blue",
                                            //    groupValue: colorl,
                                            //    onChanged: (value) {
                                            // setState(() {
                                            //   colorl=value;
                                            // });
                                        
                                            // setState(() {
                                              
                                            // });
                                            // },),
                                        
                                        
                                            //   RadioListTile(
                                            //   title: Text("Green"),
                                            //   value: "Green",
                                            //    groupValue: colorl,
                                            //    onChanged: (value) {
                                            // setState(() {
                                            //   colorl=value;
                                            // });
                                            // },),
                                        
                                        
                                            //   RadioListTile(
                                            //   title: Text("Yellow"),
                                            //   value: "Yellow",
                                            //    groupValue: colorl,
                                            //    onChanged: (value) {
                                            // setState(() {
                                            //   colorl=value;
                                            // });
                                            // },)
                                        
                                            // InkWell(
                                            //   onTap: () async{
                                                
                                            //        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                            //        sharedPreferences.setString("colorl" , "Red");
                                                  
                                            //   },
                                            //   child: Row(
                                            //     children: [
                                            //       Text("Red"),
                                            //       IconButton(onPressed: (){
                                            //       setState(() {
                                            //         colorl = "Red";
                                            //       });
                                            //       }, icon: Icon(Icons.invert_colors , color: Colors.red,)),
                                            //     ],
                                            //   ),
                                            // ) ,
                                        
                                            // InkWell(
                                            //   onTap: () {
                                            //      setState(() async{
                                            //            SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                            //        sharedPreferences.setString("colorl" , "Blue");
                                            //        });
                                            //   },
                                            //   child: Row(
                                            //     children: [
                                            //       Text("Blue"),
                                            //       IconButton(onPressed: ()async{
                                            //       SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                            //        sharedPreferences.setString("colorl" , "Blue");
                                            //       }, icon: Icon(Icons.invert_colors , color: Colors.blue,)),
                                            //     ],
                                            //   ),
                                            // ),
                                        
                                        
                                            // InkWell(
                                            //   onTap: () {
                                            //     setState(() {
                                            //           colorl = "Yellow";
                                            //         });
                                            //   },
                                            //   child: Row(
                                            //     children: [
                                            //       Text("Yellow"),
                                            //       IconButton(onPressed: (){
                                            //         setState(() {
                                            //           colorl = "Yellow";
                                            //         });
                                            //       }, icon: Icon(Icons.invert_colors , color: Colors.yellow,)),
                                            //     ],
                                            //   ),
                                            // ),
                                        
                                        
                                            // InkWell(
                                            //   onTap: () {
                                            //      setState(() {
                                            //           colorl = "Green";
                                            //         });
                                            //   },
                                            //   child: Row(
                                            //     mainAxisAlignment: MainAxisAlignment.start,
                                            //     children: [
                                            //       Text("Green"),
                                            //       IconButton(onPressed: (){
                                            //          setState(() {
                                            //           colorl = "Green";
                                            //         });
                                            //       }, icon: Icon(Icons.invert_colors , color: Colors.green,)),
                                            //     ],
                                            //   ),
                                            // ),
                                        
                                            //                   ],)
                                            //                 )..show();
                                            //           }, icon: Icon(Icons.invert_colors_on_sharp)),
                                        
                                            //                                        Text("Color")
                                            //   ],
                                            // ),
                                        
                                              ],
                                            )
                                        )
                                          ]) ,
                                        
                                           
                                        ],
                                      ),
                                    ),
                                  
                                  
                                  ],
                                ),
                              ),
                          );
                        },
                      )),
                ),
          ],
        ),
      ),
    );
    
  }
}





 //*************************************************************************************** */



