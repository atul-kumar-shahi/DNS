import 'package:dns_intro/pages/signup.dart';
import 'package:dns_intro/widgets/custom_button.dart';
import 'package:dns_intro/widgets/custom_text.dart';
import 'package:dns_intro/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailSignIn extends StatefulWidget {
  const EmailSignIn({super.key});

  @override
  State<EmailSignIn> createState() => _EmailSignInState();
}

class _EmailSignInState extends State<EmailSignIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> login() async {
    final auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text);
  }

   void onSignUpPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUp()));
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            CustomTextField(
              controller: _emailController,
              hintText: 'Enter your Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                controller: _passwordController,
                hintText: 'Enter your password',
                isObscuredText: true),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: const Text('Forget Password?',style: TextStyle(color: Colors.blue),),
                onTap: () {},
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
            onTap: () {
              if (_emailController.text.isNotEmpty &&
                  _passwordController.text.length > 6) {
                login();
              } else {
                debugPrint('Please enter a valid email or password');
              }
            },
            text: 'Sign In'),
        const SizedBox(height: 10,),
        CustomText(onTap:(){
          onSignUpPage();
        })
        // ElevatedButton(
        //     onPressed: () {
        //       final auth=FirebaseAuth.instance;
        //       auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
        //     },
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: Colors.white,
        //       foregroundColor: Colors.blue,
        //       elevation: 12,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
        //     ),
        //     child: Text('sign up'))
      ],
    );
  }
}
