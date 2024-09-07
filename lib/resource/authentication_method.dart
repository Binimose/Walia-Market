import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:waliamarket/resource/cloud_firestore.dart';


class AuthenticationMethods {

  FirebaseAuth Auth = FirebaseAuth.instance;
  CloudFireStorre firebaseFirestore = CloudFireStorre();
   

  User? get currentUser => Auth.currentUser;

  Future<String> signUp({
    required String name,
    required String address,
    required String email,
    required String password,
  }) async {
    // Trim the input strings
    name = name.trim();
    email = email.trim();
    address = address.trim();
    password = password.trim();

    String output = 'Something went wrong';

    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty && address.isNotEmpty) {
      try {
        // Create user with email and password
        await Auth.createUserWithEmailAndPassword(email: email, password: password);
        
        // Add user details to Firestore
        await firebaseFirestore.uploadNameAndAddress(name: name, address: address);
        
        output = 'success';
        print("User signed up successfully");
      } on FirebaseAuthException catch (e) {
        output = e.message ?? 'An unknown error occurred';
      }
    } else {
      output = 'Please fill up all the fields';
    }

    return output;
  }

  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    // Trim the input strings
    email = email.trim();
    password = password.trim();

    String output = 'Something went wrong';

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        // Sign in user with email and password
        await Auth.signInWithEmailAndPassword(email: email, password: password);
        
        output = 'success';
        print("User signed in successfully");
      } on FirebaseAuthException catch (e) {
        output = e.message ?? 'An unknown error occurred';
      }
    } else {
      output = 'Please fill up all the fields';
    }

    return output;
  }
}
