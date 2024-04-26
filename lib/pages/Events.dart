import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            child: SvgPicture.asset('assets/images/back.svg'),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: const Center(
        child: Text('Upcoming Events'),
      ),
    );
  }
}
