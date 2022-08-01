import 'package:flutter/material.dart';
import 'package:quick_chat/login_screen.dart';
import 'package:quick_chat/welcomescreen.dart';
import 'package:quick_chat/Chat_Screen.dart';
import 'package:quick_chat/Registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),

      initialRoute: homepage.id,
      routes: {
         homepage.id: (context)=> homepage(),
        login.id: (context)=>login(),
        registration.id : (context)=> registration(),
        chat.id : (context)=> chat(),
      },
      home: login(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}

