import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SETTINGS"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
        actions: [
        ],
      ),
    );
  }
}
