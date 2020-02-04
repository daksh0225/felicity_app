import 'main.dart';
import 'package:flutter/material.dart';
import 'sign_in.dart';
import 'first_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'sign_in.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
bool loading = false;

bool isLoggedIn = false;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override 
  void initState() {
    super.initState();
    isSignedIn();
    }

    void isSignedIn() async {
    setState(() {
      loading = true;
    });

    isLoggedIn = await googleSignIn.isSignedIn();

    if (isLoggedIn) {
      signInWithGoogle(context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/char minar 1.png'),
        //     fit: BoxFit.fitHeight
        //   )
        // ),
        // color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // FlutterLogo(size: 150),
              Image(image: AssetImage("assets/felicity_logo_white.png"), height: 150.0,),
              SizedBox(height: 50),
              _signInButton(),
            ],
          ),
        ),
      ),
      // backgroundColor: Colors.blue,
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle(context).whenComplete(() {
          print('daksh');
          print(x);
          if(x!=null){
            Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            ),
          );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 30.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign In with Google',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  // Widget _signUpButton() {
  //   return OutlineButton(
  //     splashColor: Colors.grey,
  //     onPressed: () {
  //       x = signUpWithGoogle().whenComplete(() {
  //         // print(x);
  //         if(x!=null){
  //           Navigator.of(context).pushReplacement(
  //             MaterialPageRoute(
  //               builder: (context) {
  //                 return HomePage();
  //               },
  //             ),
  //           );
  //         }
  //       });
  //     },
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
  //     highlightElevation: 0,
  //     borderSide: BorderSide(color: Colors.grey),
  //     child: Padding(
  //       padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Image(image: AssetImage("assets/google_logo.png"), height: 30.0),
  //           Padding(
  //             padding: const EdgeInsets.only(left: 10),
  //             child: Text(
  //               'Sign up with Google',
  //               style: TextStyle(
  //                 fontSize: 18,
  //                 color: Colors.grey,
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}