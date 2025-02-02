import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String reciverEmail;
  //final String reciverName;
  const ChatPage(
      {super.key, required this.reciverEmail, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(reciverEmail), // we will use name instend
      ),
    );
  }
}
