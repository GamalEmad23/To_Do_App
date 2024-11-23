// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_build_context_synchronously, camel_case_types, unused_element, avoid_print, unused_field, prefer_const_literals_to_create_immutables, avoid_single_cascade_in_expression_statements, non_constant_identifier_names, body_might_complete_normally_nullable

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:tadween/presentation/pages/addList.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tadween/presentation/pages/loginPage.dart';
import 'package:tadween/presentation/pages/welcomPage.dart';

class HomePageToDo extends StatefulWidget {
  const HomePageToDo({super.key});

  @override
  State<HomePageToDo> createState() => _HomePageToDoState();
}

class _HomePageToDoState extends State<HomePageToDo> {
  bool loading = true;
  
  // List<String> items = [
  //   "Red","Blue","Green","Yellow"
  // ];
  //  String? colorl = "Blue";
  
  List<QueryDocumentSnapshot> datalist = [];
  List<bool> CheckValue = List.filled(100000000, false);
  getDatalist() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Lists').where("id" , isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
    datalist.addAll(querySnapshot.docs);
    setState(() {});
  }

  

  @override
  void initState() {
    getDatalist();
    Timer( Duration(milliseconds: 1000),() {
      setState(() {
        loading=false;
      });
    },);
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
          return AddLists();
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
       actions: [
        IconButton(onPressed: (){
          showSearch(context: context, delegate: customSearch());
        }, icon: Icon(Icons.search_outlined)),
        MaterialButton(onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => WelcomePage(),));
      
      },
      child: Text("Back" , style: TextStyle(
        fontSize: 20
      ),),
      )],
      title: Text("Lists" , style: TextStyle(
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
                            crossAxisCount: 1, mainAxisExtent: size.height*.09 , crossAxisSpacing: size.width),
                        itemCount: datalist.length,
                        itemBuilder: (context, index) {
                          return Skeletonizer(
                            effect: PulseEffect(),
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
                                      child:
                                        
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                            
                                             Checkbox(
                                              fillColor: WidgetStatePropertyAll(Colors.white),
                                              hoverColor: Colors.black,
                                              focusColor: Colors.black,
                                              activeColor: Colors.black,
                                              checkColor: Colors.black,
                                              side: BorderSide(
                                                width: 20
                                              ),
                                              value: CheckValue[index], onChanged: (value) {
                                               setState(() {
                                                 CheckValue[index] = value!;
                                               });
                                             },),                                  
                                            Container(
                                        // padding: EdgeInsets.all(30),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                                child: Text("${datalist[index]['titleList']}",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ))),
                                          ],
                                        )),
                                          PopupMenuButton(
                                            color: Colors.white,
                                            iconColor: Colors.white,
                                             itemBuilder: (context) => [
                                            PopupMenuItem(child: Column(
                                              children: [
                                                  Row(
                                                    children: [
                                                      IconButton(onPressed: ()async{
                                                                                          await FirebaseFirestore.instance
                                                                                            .collection('Lists')
                                                                                            .doc(datalist[index].id)
                                                                                            .delete();
                                                                                        setState(() {});
                                                                                        Navigator.of(context).
                                                                                  pushReplacement(MaterialPageRoute(builder: (context) => HomePageToDo(),));
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
                                        
                                        
                                              
                                        
                                              ],
                                            )
                                        )
                                          ]) ,
                                        
                                           
                                        ],
                                      ),
                            )]),
                                  
                                  
                                ),
                          );}
                              )
                              )
                              )]
                              )));
                            
                        
                      
  }
  }
  






 //*************************************************************************************** */

class customSearch extends SearchDelegate{
  List<QueryDocumentSnapshot> datalist = [];
  List<bool> CheckValue = List.filled(100000000, false);
  getDatalist() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Lists').get();
    datalist.addAll(querySnapshot.docs);
 
  }

  @override


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query="";

      }, icon: Icon(Icons.close))
    ];

  }

  @override
  Widget? buildLeading(BuildContext context) {

      IconButton(onPressed: (){
      }, icon: Icon(Icons.arrow_back));
   
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return  Container(
                      decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                  
                      ),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, mainAxisExtent: 100 , crossAxisSpacing: 100),
                        itemCount: datalist.length,
                        itemBuilder: (context, index) {
                          return Card(
                              // elevation: 30,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              shadowColor: Colors.black,
                              // color: colorl =="Red" ? Colors.red: colorl== "Blue" ? Colors.blue : colorl== "Green" ? Colors.green : colorl == "Yellow" ? Colors.amber: Colors.white,
                              color: const Color.fromARGB(255, 18, 106, 228),
                              surfaceTintColor: const Color.fromARGB(255, 41, 96, 64),
                              margin: EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 
            
            
            
            
                                  Container(
                                    alignment: Alignment.topRight,
                                    child:
            
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [                           
                                          Container(
                                      // padding: EdgeInsets.all(30),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                              child: Text("${datalist[index]['titleList']}",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ))),
                                        ],
                                      )),
                                      
            
                                         
                                      ],
                                    ),
                          )]),
                                
                                
                              );}
                              )
    );
   
  }
  
}

