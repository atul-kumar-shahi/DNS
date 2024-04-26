import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key,required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('don\'t have an account? '),
          GestureDetector(onTap:onTap,child: const Text('Sign Up ',style: TextStyle(color: Colors.blue,fontSize: 16),)),
        ],
      ),
    );
  }
}
