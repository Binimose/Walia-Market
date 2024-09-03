import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFireStorre{
 FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
 FirebaseAuth auth = FirebaseAuth.instance;

Future uploadNameAndAddress({required String name,required String address})async{
  await firebaseFirestore.collection('user').doc(auth.currentUser!.uid).set({
    'name':name,
    'address':address
  });


}


}