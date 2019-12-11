import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'main.dart';
import 'login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
  String name;
  String email;
  String imageUrl;
  String phnumber;
Future<String> signInWithGoogle() async {
  signOutGoogle();

  GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  print ('google');
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );
  // final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
  // print("signed in " + user.displayName);
  // final AuthResult authResult = await _auth.signInWithCredential(credential);
  // final FirebaseUser user = authResult.user;

  FirebaseUser user = 
  await _auth.signInWithCredential(credential);
  
  name = user.displayName;
  email = user.email;
  imageUrl = user.photoUrl;
  // phnumber = user.phoneNumber;
  // var y=null;
  // var y = Firestore.instance.collection('users').document(email).get();
  // Firestore.instance.collection('users').document(email).setData({
  //     "Name": name,
  //     "email": email,
  //   });
  print(name);
  print('hello');
  print(user.phoneNumber);
  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);
  assert(user.phoneNumber != null);
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);
  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
  if (name.contains(" ")) 
  {   
    name = name.substring(0, name.indexOf(" "));
  }
  return 'signInWithGoogle succeeded: $user';
}

Future<String> signUpWithGoogle() async {
  signOutGoogle();

  GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );
  // final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
  // print("signed in " + user.displayName);
  // final AuthResult authResult = await _auth.signInWithCredential(credential);
  // final FirebaseUser user = authResult.user;

  FirebaseUser user = 
  await _auth.signInWithCredential(credential);
  
  name = user.displayName;
  email = user.email;
  imageUrl = user.photoUrl;
  // phnumber = user.phoneNumber;
  print(name);
  print('hello');
  print(user.phoneNumber);
  Firestore.instance.collection('users').document(email).setData({
    "Name": name,
    "email": email,
    }
  );
  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);
  assert(user.phoneNumber != null);
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);
  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
  if (name.contains(" ")) 
  {   
    name = name.substring(0, name.indexOf(" "));
  }
  return 'signInWithGoogle succeeded: $user';
}

void signOutGoogle() async{
  await googleSignIn.signOut();

  print("User Sign Out");
}