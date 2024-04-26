import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key,required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('don\'t have an account? '),
          GestureDetector(onTap:onTap,child: Text('Sign Up ',style: TextStyle(color: Colors.blue,fontSize: 16),)),
        ],
      ),
    );
  }
}
