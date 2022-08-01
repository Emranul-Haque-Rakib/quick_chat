import 'package:flutter/material.dart';
import 'package:quick_chat/Registration_screen.dart';
import 'package:quick_chat/login_screen.dart';

class homepage extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 5), vsync: this);

    controller.forward();

    controller.addListener(() {
      setState(() {});
      print(controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red.withOpacity(controller.value),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'logo',
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Image.asset("lib/images/chat.png"),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Quick Chat",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, login.id);
                },
                child: Text("Login"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreen, shape: StadiumBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, registration.id);
                },
                child: Text("Registrer"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green, shape: StadiumBorder()),
              )
            ],
          ),
        ));
  }
}
