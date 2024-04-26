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
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),
            ),
            accountEmail: Text(_user!.email!,
                style: TextStyle(color: Colors.black)),
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
            leading: Icon(Icons.accessibility_new_rounded),
            title: Text('Mentors'),
            trailing: IconButton(
              icon: Icon(Icons.arrow_drop_down),
              onPressed: (){
                Column(
                  children: [
                    Text('Hello')
                  ],
                );
              },
            ),
            onTap: (){
              DropdownMenuItem(
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Mentors()));
            },
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text('Upcoming Events'),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Events()));
            },
          ),
          ListTile(

            leading: SvgPicture.asset('assets/images/about.svg',height: 25,color: Colors.blue,),
            title: Text('About'),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>About()));
            },
          ),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: (){
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
