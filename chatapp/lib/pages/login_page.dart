import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // email & Password controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

   LoginPage({super.key});

   // login Function
  void login(){
      // doing later..
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
            const SizedBox(height: 50,),

            // welcome message
            Text("Welocme to Chatboot",
            style: TextStyle(
                color :Theme.of(context).colorScheme.primary,
                fontSize: 16),),
            const SizedBox(height: 25,),
            // email
            MyTextfield(
              hinText: "Email..",
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(height: 10,),
            // password
            MyTextfield(
              hinText: "Password..",
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 10,),
            // login
            MyButton(
              text: "Login",
                onTap: login
            ),
            const SizedBox(height: 10,),
            // reg
            Text("Not a member? Register now")

          ],
        ),
      ),
    );
  }
}
