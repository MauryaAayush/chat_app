
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textField.dart';
import '../services/auth/auth_service.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _txtemail = TextEditingController();
  final TextEditingController _txtpass = TextEditingController();
  final TextEditingController _txtcnfpass = TextEditingController();
  final TextEditingController _txtname = TextEditingController();
  final TextEditingController _txtmobile = TextEditingController();

  // to go to register page
  final void Function()? onTap;

  RegisterScreen({super.key, required this.onTap});

  void register(BuildContext context) {
    final _auth = AuthService();

    // if password match
    if (_txtcnfpass.text == _txtpass.text) {
      try {
        _auth.signUpWithEmailPassword(_txtemail.text, _txtpass.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }

    // if password doesn't match
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Password doesn't match!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //     logo
              Icon(
                Icons.message,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(
                height: 50,
              ),
        
              // welcome back msg
              Text(
                "Let's Create an account for you",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
              ),
        
              const SizedBox(
                height: 25,
              ),
        
        
              // name textfield
              MyTextField(
                hintText: "Enter Your Name",
                obscureText: false,
                controller: _txtname,
              ),
              const SizedBox(
                height: 10,
              ),
        
              // mobile number
        
              MyTextField(
                hintText: "Mobile Number",
                obscureText: false,
                controller: _txtmobile,
              ),
              const SizedBox(
                height: 10,
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
              // confirm password
              const SizedBox(
                height: 10,
              ),
              //   pass textfield
              MyTextField(
                hintText: "Confirm Password",
                obscureText: true,
                controller: _txtcnfpass,
              ),
              //   login button
              const SizedBox(
                height: 25,
              ),
        
              MyButton(
                text: "Register",
                onTap: () => register(context),
              ),
              //   register now
              const SizedBox(
                height: 25,
              ),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      'Login now',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
