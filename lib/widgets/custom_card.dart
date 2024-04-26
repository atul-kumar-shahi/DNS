import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.8,
      shadowColor: Colors.red,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),boxShadow:[
          // BoxShadow(
          //   color: Colors.red,
          //   blurRadius: 10,
          //   spreadRadius: 2,
          // )
        ]
        ),
        padding: EdgeInsets.only(left: 20, right: 20,top: 20,bottom: 20),
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo.jpg',
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
            const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                    'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut'
                    ' aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in')
          ],
        ),
      ),
    );
  }
}
