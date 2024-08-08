import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:flutter/material.dart';

import '../components/my_textField.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _txtemail = TextEditingController();
  final TextEditingController _txtpass = TextEditingController();

  // to go to register page
  final void Function()? onTap;

  LoginScreen({super.key,required this.onTap,});

  // login method
  Future<void> login (BuildContext context) async {
  //   auth service
    final authService = AuthService();

    try{
      await authService.signInWithEmailPassword(_txtemail.text, _txtpass.text);
    }catch(e){
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text(e.toString()),
      ),);
    }
  }


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

            const SizedBox(height: 25,),

            //   email textfield
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: _txtemail,
            ),
            const SizedBox(height: 10,),
            //   pass textfield
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _txtpass,
            ),
            //   login button
            const SizedBox(height: 25,),

            MyButton(text: "Login",onTap: () => login(context),),
            //   register now
            const SizedBox(height: 25,),

            Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                Text('Not a member? ',style: TextStyle(
                  color: Theme.of(context).colorScheme.primary
                ),),
                GestureDetector(
                  onTap: onTap,
                  child: Text('Register now',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary
                  ),),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
