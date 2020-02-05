import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'main.dart';
import 'login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'first_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
  String name;
  String email;
  String imageUrl;
Future<String> signInWithGoogle(BuildContext context) async {
  // signOutGoogle();
  GoogleSignInAuthentication googleSignInAuthentication;
  GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  print ('google');
  print(googleSignInAccount);
  if(googleSignInAccount == null)
  {
    print('hello wolrld1');
    x = null;
  }
  else
  {
    x = googleSignInAccount;
  }
  googleSignInAuthentication =
      await googleSignInAccount.authentication;
  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  FirebaseUser user = await _auth.signInWithCredential(credential);
  
  name = user.displayName;
  email = user.email;
  imageUrl = user.photoUrl;
  if (Firestore.instance.collection('users').document(email) == null){
    Firestore.instance.collection('users').document(email).setData({
        "Name": name,
        "email": email,
      });
  }
  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);
  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
  return 'signInWithGoogle succeeded: $user';
}

// Future<String> signUpWithGoogle() async {
//   // signOutGoogle();

//   GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//   final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount.authentication;

//   final AuthCredential credential = GoogleAuthProvider.getCredential(
//     accessToken: googleSignInAuthentication.accessToken,
//     idToken: googleSignInAuthentication.idToken,
//   );
//   FirebaseUser user = 
//   await _auth.signInWithCredential(credential);
  
//   name = user.displayName;
//   email = user.email;
//   imageUrl = user.photoUrl;
//   Firestore.instance.collection('users').document(email).setData({
//     "Name": name,
//     "email": email,
//     }
//   );
//   assert(user.email != null);
//   assert(user.displayName != null);
//   assert(user.photoUrl != null);
//   assert(await user.getIdToken() != null);
//   final FirebaseUser currentUser = await _auth.currentUser();
//   assert(user.uid == currentUser.uid);
//   return 'signInWithGoogle succeeded: $user';
// }

void signOutGoogle() async{
  await googleSignIn.signOut();
  name = null;
  email = null;
  imageUrl = null;
  print("User Sign Out");
}