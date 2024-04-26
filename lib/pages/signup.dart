import 'package:dns_intro/widgets/custom_button.dart';
import 'package:dns_intro/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassordController=TextEditingController();

  void signUp(){
    final auth =FirebaseAuth.instance;
    auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 50,),
              Icon(Icons.lock,size: 100,),
              SizedBox(height: 50,),
              Text('Enter Your Email and Password to Login',style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 16,
              ),),
              SizedBox(height: 30,),
              CustomTextField(
                controller: _emailController,
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10,),
              CustomTextField(
                controller: _passwordController,
                hintText: 'Enter your password',
                isObscuredText: true,
              ),
              SizedBox(height: 10,),
              CustomTextField(
                controller: _confirmPassordController,
                hintText: 'Confirm password',
                isObscuredText: true,
              ),
              SizedBox(height: 50,),
              CustomButton(text: 'Sign Up', onTap: (){
                if (_emailController.text.isNotEmpty &&
                    _passwordController.text.length > 6) {
                  signUp();
                } else {
                  debugPrint('Please enter a valid email or password');
                }
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              })
            ],
          ),
        ),
      ),
    );
  }
}
