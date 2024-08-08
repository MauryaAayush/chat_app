import 'package:flutter/material.dart';

import '../components/my_textField.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _txtemail = TextEditingController();
  final TextEditingController _txtpass = TextEditingController();

  LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //     logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 50,),

            // welcome back msg
            Text(
              "Welcome back, you've been missed!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            //   email textfield
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: _txtemail,
            ),
            const SizedBox(
              height: 10,
            ),
            //   pass textfield
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _txtpass,
            ),
            //   login button
            const SizedBox(
              height: 25,
            ),
            //   register now
          ],
        ),
      ),
    );
  }
}
