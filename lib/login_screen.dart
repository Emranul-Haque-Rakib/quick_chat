import 'package:flutter/material.dart';

class login extends StatelessWidget {

  static String id ='login_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero (
            tag: 'logo',
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Container(
                height: 200,

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
            child: ElevatedButton(onPressed: (){


            }, child: Text("LOGIN"),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                minimumSize: const Size.fromHeight(40), // NEW
              ),
            ),
          )




        ],
      ),
    );

    throw UnimplementedError();
  }
}
