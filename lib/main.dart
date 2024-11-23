// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tadween/firebase_options.dart';
import 'package:tadween/page/homepage2.dart';
import 'package:tadween/presentation/pages/welcomPage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({ super.key });

  @override
  State<MyApp> createState() => __MyAppState();
}

class __MyAppState extends State<MyApp> {
  @override
  void initState() {
   FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('=====================================================User is currently signed out!');
    } else {
      print('=====================================================User is signed in!');
    }
  });
    super.initState();
  }
  
  @override





  
  Widget build(BuildContext context) {
    return MaterialApp(
        home: (FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser!.emailVerified) ? WelcomePage() : Homepage2(),
    );
  }
}