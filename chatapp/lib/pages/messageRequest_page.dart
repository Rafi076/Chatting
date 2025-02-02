import 'package:flutter/material.dart';

class MessagerequestPage extends StatelessWidget {
  const MessagerequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("REQUEST"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [],
      ),
    );
  }
}
