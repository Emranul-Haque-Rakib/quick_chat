import 'package:flutter/material.dart';

class registration extends StatefulWidget {
  static String id = 'Registration_screen';

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.forward();

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1.00);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    animation.addListener(() {
      setState(() {});
    });
  }

  void dispose(){
    controller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: 'logo',
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Container(
                height: animation.value * 100,
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
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Registar"),
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
