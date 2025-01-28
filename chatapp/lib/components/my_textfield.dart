import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hinText;
  final bool obscureText;
  final TextEditingController controller;

  const MyTextfield({
    super.key,
    required this.hinText,
    required this.obscureText,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        obscureText: obscureText ,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)
        ),
          fillColor: Theme.of(context).colorScheme.tertiary,
          filled: true,
          hintText: hinText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        )
      ),
    );
  }
}
