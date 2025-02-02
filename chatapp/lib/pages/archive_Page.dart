import 'package:flutter/material.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Archive"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [],
      ),
    );
  }
}
