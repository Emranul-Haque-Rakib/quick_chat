import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quick_chat/Chat_Screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class registration extends StatefulWidget {
  static String id = 'Registration_screen';

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration>
    with SingleTickerProviderStateMixin {
  final _auth = FirebaseAuth.instance;
  late Animation animation;
  late AnimationController controller;

  late String email;
  late String Password;

  bool _spinner = false;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.forward();

    animation.addListener(() {
      setState(() {});
    });
  }

  void dispose() {
    controller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _spinner,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Container(
                      height: animation.value * 50,
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
                        final newUser = await _auth.createUserWithEmailAndPassword(
                            email: email, password: Password);

                        if (newUser != null) {
                          Navigator.pushNamed(context, chat.id);
                          setState(() {
                            _spinner = false;
                          });
                        }

                      } catch (e) {
                        print(e);
                      }
                      ;
                    },
                    child: Text("Registar"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      minimumSize: const Size.fromHeight(40), // NEW
                    ),
                  ),
                )
              ],
            ),
          ],

        )

      ),
    );
    throw UnimplementedError();
  }
}
