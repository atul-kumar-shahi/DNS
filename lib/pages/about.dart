import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(15),
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: SvgPicture.asset('assets/images/back.svg'),
          ),
        ),
      ),
      body: const Center(child: Text('About Section')),
    );
  }
}
