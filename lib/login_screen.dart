import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quick_chat/Chat_Screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class login extends StatefulWidget {
  static String id = 'login_screen';

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _auth = FirebaseAuth.instance;

  late String email;

  late String Password;

  bool _spinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ModalProgressHUD(
        inAsyncCall: _spinner,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'logo',
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Container(
                    height: 150,
                    child: Image.asset("lib/images/chat.png"),
                  ),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              const Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      hintText: "Provide your Email"),
                ),
              ),
              const Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  onChanged: (value) {
                    Password = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      hintText: "Provide your Password"),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _spinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: Password);
                      if (user != null) {
                        Navigator.pushNamed(context, chat.id);

                        setState(() {
                          _spinner = false;
                        });
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text("LOGIN"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    minimumSize: const Size.fromHeight(40), // NEW
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

    throw UnimplementedError();
  }
}
