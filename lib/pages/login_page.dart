import 'package:dns_intro/widgets/square_tile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sign_in_button/sign_in_button.dart';

class GoogleLogin extends StatefulWidget {
  const GoogleLogin({super.key});

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {

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
  // Widget _userInfo(){
  //   return SizedBox(
  //     width: MediaQuery.of(context).size.width,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisSize: MainAxisSize.max,
  //       children: [
  //         Container(
  //           height: 100,
  //           width: 100,
  //           decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(_user!.photoURL!),),),
  //         ),
  //         Text(_user!.email!),
  //         Text(_user!.displayName??""),
  //         MaterialButton(onPressed: _auth.signOut,child: Text('SignOut'),)
  //
  //       ],
  //     ),
  //   );
  // }

  void _handleGoogleSignIn(){
    try{
      GoogleAuthProvider _googleAuthProvider=GoogleAuthProvider();
      _auth.signInWithProvider(_googleAuthProvider);

    }catch(error){
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      // _user!=null?_userInfo():
      Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SquareTile(imagePath: 'assets/images/google.png', onTap: _handleGoogleSignIn),
          SizedBox(width: 50,),
          SquareTile(imagePath: 'assets/images/github-mark.png', onTap: (){}),
        ],
      ),
    );

  }
}
