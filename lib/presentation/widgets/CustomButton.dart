
// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.function, required this.title,
  });

  final Function function;
  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
          padding: EdgeInsets.symmetric(horizontal: size.width*.025),
     child: MaterialButton(
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
       color: Colors.cyan,
       minWidth: size.width*.95,
       height: size.height*.049,
       onPressed:(){
       
     } , child: Text("$title"),),
    );
  }
}
