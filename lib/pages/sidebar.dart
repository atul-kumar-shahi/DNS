import 'package:dns_intro/pages/about.dart';
import 'package:dns_intro/pages/mentors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dns_intro/pages/Events.dart';



class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  User?_user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user=event;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(

            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: 0.4,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/navback.jpg',)
              ),
              color: Colors.grey,
            ),
            accountName: Text(_user!.displayName??
              'Developer Network Society',
              style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),
            ),
            accountEmail: Text(_user!.email!,
                style: const TextStyle(color: Colors.black)),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: ClipOval(
                    child: Image.asset(
                  'assets/images/logo.jpg',
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ))),
          ),
          ListTile(
            leading: const Icon(Icons.accessibility_new_rounded),
            title: const Text('Mentors'),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_drop_down),
              onPressed: (){
                const Column(
                  children: [
                    Text('Hello')
                  ],
                );
              },
            ),
            onTap: (){
              const DropdownMenuItem(
                child: Column(
                  children: [
                    Text('Hello'),
                    Text('Hello'),
                    Text('Hello'),
                    Text('Hello'),
                  ],
                ),
              );
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Mentors()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.event),
            title: const Text('Upcoming Events'),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Events()));
            },
          ),
          ListTile(

            leading: SvgPicture.asset('assets/images/about.svg',height: 25,color: Colors.blue,),
            title: const Text('About'),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const About()));
            },
          ),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: (){
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
