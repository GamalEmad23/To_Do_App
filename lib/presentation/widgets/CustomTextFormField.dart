
// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, body_might_complete_normally_nullable, must_be_immutable

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
 bool ret= false;

   CustomTextFormField({
    super.key, required this.control, required this.text,
  });


  final TextEditingController control;
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:size.width*.027 ),
      
        child: Container(
          color: Colors.blueGrey[50],
          child: TextFormField(
            validator: (value) {
              if(value!.isEmpty)
              {
                return "Please enter  any thing";
              }
            },
            maxLines: 4,
            textAlign: TextAlign.left,
            textDirection: ret == true ?TextDirection.ltr : TextDirection.rtl ,
            maxLength: 20,
            minLines: 1,
            controller: control,
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255)
            ),
             decoration: InputDecoration(
              // suffixIcon: IconButton( onPressed: (){
              //   ret = true;
              // },icon: Icon( Icons.replay_circle_filled)),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1
                )
              ),
              hintText: "$text",

              hintStyle: TextStyle(
                color: Colors.white
              ),
              fillColor: Colors.indigo[900],
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(2)
                
              ),

              
            ),
          ),
        ),
      );
  }
}