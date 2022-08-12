import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class chat extends StatefulWidget {
  static String id = 'chat_screen';

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  late String messageText;

  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCurrentUser();
  }

  final _auth = FirebaseAuth.instance;

  late User LoggedInUser;

  void getCurrentUser() async {
    try {
      final user = await FirebaseAuth.instance.currentUser;
      if (user != null) {
        LoggedInUser = user;
        print(LoggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void messageStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              messageStream();
            },
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('messages').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final messages = snapshot.data!.docs;
                    List<Text> messageWidgets = [];


                    snapshot.data!.docs
        .map((DocumentSnapshot document) {
    Map<String, dynamic> data =
    document.data()! as Map<String, dynamic>;



                    for (var message in messages) {
                      final messageText = message.get('text');
                      final senderText = message.get('sender');


                      final messageWidget = Text('$messageText from $senderText');
                      //     final messageWidget= Text(data['text']);

                      messageWidgets.add(messageWidget);
                    }
                    return Column(
                      children: messageWidgets,
                    );
                  }
                  return Text("No widget to build");
                },
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(child: TextField(
                      onChanged: (value) {
                        messageText = value;
                      },
                    )),
                    ElevatedButton(
                      onPressed: () {
                        _firestore.collection('messages').add(
                            {'text': messageText, 'sender': LoggedInUser.email});
                      },
                      child: Text("Send"),
                    )
                  ],
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
