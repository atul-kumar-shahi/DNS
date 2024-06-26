import 'package:dns_intro/pages/email_login.dart';
import 'package:dns_intro/pages/login_page.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child:  SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 50,),
              const Icon(Icons.lock,size: 100,),
              const SizedBox(height: 50,),
              Text('Welcome back you\'ve been missed!',style: TextStyle(
                color:Colors.grey.shade700,
                fontSize: 16
              ),),
              const SizedBox(height: 20,),
              const EmailSignIn(),
              const SizedBox(height: 60,),
              Padding(
                padding:const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Or continue with',style: TextStyle(
                        color: Colors.grey.shade700,
                      ),),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),

              const GoogleLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
