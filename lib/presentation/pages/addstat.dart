
// ignore_for_file: non_constant_identifier_names, unused_element, annotate_overrides, prefer_const_constructors, avoid_print, use_build_context_synchronously

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:revesion_app/presentation/widgets/CustomButton.dart';
// import 'package:revesion_app/presentation/widgets/CustomTextFormField.dart';

// class add extends StatefulWidget {
//   const add({super.key});

//   @override
//   State<add> createState() => _addState();
// }

// class _addState extends State<add> {
 
//     GlobalKey<FormState> global = GlobalKey<FormState>();
//       TextEditingController name = TextEditingController();

     
 
 
//     Widget build(BuildContext context) {
    
//     CollectionReference Categories = FirebaseFirestore.instance.collection('Categories');

//     Future<void> addUser(){
//       // Call the user's CollectionReference to add a new user
//       return   Categories
//           .add({
//             "name":name.text,
//           })
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     }

 
//  @override

   
//     Size size = MediaQuery.of(context).size;
//     return Form(
//       key: global,
//       child: Column(
//       children: [
//               SizedBox(height: size.height*.029,),
//               CustomTextFormField(control: name, text: 'Title',),
//               // SizedBox(height: size.height*.025,),
//               // CustomTextFormField(control: content, text: 'Content',),
//               SizedBox(height: size.height*.035,),
//               CustomButton(function: (){
                
//               }, title: 'Add')


              

           
//       ],
//     ));
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tadween/presentation/pages/homepage.dart';
import 'package:tadween/presentation/widgets/CustomTextFormField.dart';

class AddCatergories extends StatefulWidget {
  const AddCatergories({super.key});

  @override
  State<AddCatergories> createState() => _AddCatergoriesState();
}

class _AddCatergoriesState extends State<AddCatergories> {

  GlobalKey<FormState> global = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
   CollectionReference categories = FirebaseFirestore.instance.collection('categories');

    Future<void> addUser() async{
      // Call the user's CollectionReference to add a new user
     
          if(global.currentState!.validate()){
             await categories
            .add({
            'title': title.text, // John Doe
            'content':content.text,
            'id':FirebaseAuth.instance.currentUser!.uid,
            
           
          })
           .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(),));
          }
          else{
            print("object");
          }
        
    }

  @override
  Widget build(BuildContext context) {
     
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
      key: global,
      child: Container(
        color: Colors.indigo[900],
        child: ListView(
        children: [
                SizedBox(height: size.height*.029,),
                CustomTextFormField(control: title, text: 'Title',),
          
                SizedBox(height: size.height*.025,),
                CustomTextFormField(control:content , text: 'Content',),
                SizedBox(height: size.height*.035,),
                // CustomButton(function: (){
                //   addUser();
                // }, title: 'Add')
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * .3),
            padding: EdgeInsets.symmetric(horizontal: size.width*.025),
             child: Center(
         child: MaterialButton(
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
           color:  Color.fromARGB(255, 22, 41, 152),
           minWidth: size.width*.95,
           height: size.height*.049,
           onPressed:(){
           addUser();
         } , child: Text("add", style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                          ),),),
             ),
            ),
        
        
        
                
        
             
        ],
            ),
      ))
    );
  }
}