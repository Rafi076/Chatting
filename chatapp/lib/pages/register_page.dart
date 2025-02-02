import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/material.dart';

import '../services/auth/auth_service.dart';

class RegisterPage extends StatelessWidget {
  // email & Password controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  // tap to go to register page
  void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  // login Function
  void register(BuildContext context) async {
    // AuthService instance
    final authService = AuthService();

    // password match -> Create user
    if (_passwordController.text == _confirmpasswordController.text) {
      // Check if email is in correct format (simple validation)
      final email = _emailController.text;
      if (!_isValidEmail(email)) {
        _showErrorDialog(context, "Please enter a valid email.");
        return;
      }

      try {
        // Create user
        await authService.signUpWithEmailPassword(
          email,
          _passwordController.text,
        );
        // Optionally, show success message or navigate to login page
        Navigator.pushReplacementNamed(context, '/login'); // For example
      } catch (e) {
        _showErrorDialog(context, e.toString());
      }
    }
    // password don't match then show error
    else {
      _showErrorDialog(context, "Password did not match");
    }
  }

  bool _isValidEmail(String email) {
    // Simple email validation (you can improve the regex as per your need)
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(message), // Display the error message
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.chat,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 50,
            ),

            // welcome message
            Text(
              "Lets Create an account",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),
            const SizedBox(
              height: 25,
            ),
            // email
            MyTextfield(
              hinText: "Email..",
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(
              height: 10,
            ),
            // password
            MyTextfield(
              hinText: "Password..",
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextfield(
              hinText: "Confirm Password..",
              obscureText: true,
              controller: _confirmpasswordController,
            ),
            const SizedBox(
              height: 10,
            ),
            // login
            MyButton(text: "Register", onTap: () => register(context)),
            const SizedBox(
              height: 10,
            ),
            // reg
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already a member? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text("Login now",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
