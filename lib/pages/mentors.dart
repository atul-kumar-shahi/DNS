import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
final Uri _url = Uri.parse('https://flutter.dev');

class Mentors extends StatelessWidget {
  const Mentors({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        foregroundColor: Colors.grey.shade200,
        title: const Text('Mentors'),
        elevation: 0,
        backgroundColor: Colors.white24,
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/images/back.svg',
              height: 2,
              width: 2,
            ),
          ),
        ),
      ),
      body: Center(
        child: ListView(
          children: const [
            CustomCard(),
            CustomCard(),
            CustomCard(),
            CustomCard(),
            CustomCard(),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Image.asset(
            'assets/images/logo.jpg',
            fit: BoxFit.cover,
            height: 150,
            width: double.infinity,
          ),
          const Text('Android developer',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          // SizedBox(height: 10,),
          Padding(
            padding:  const EdgeInsets.all(10.0),
            child:  Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                    'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                    ' aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in',style: TextStyle(fontSize: 17,color: Colors.grey.shade700),textAlign: TextAlign.justify,),
          ),
          Row(
            children: [
              IconButton(onPressed: () async{
                await launchUrl(_url);

              }, icon: const FaIcon(FontAwesomeIcons.linkedin),),
              IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.instagram),),
              IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.envelope),)
            ],
          )


        ],
      ),
    );
  }
}
