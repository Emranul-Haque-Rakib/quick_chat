import 'package:flutter/material.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Container(
              height: 100,
              width: 100,
              child: Image.asset("lib/images/chat.png"),
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

          ElevatedButton(onPressed: (){
            

          }, child: Text("LOGIN"))




        ],
      ),
    );

    throw UnimplementedError();
  }
}
