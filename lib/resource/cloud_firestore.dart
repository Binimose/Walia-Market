import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:waliamarket/model/user_detail.dart';

class CloudFireStorre{
 FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
 FirebaseAuth auth = FirebaseAuth.instance;

Future uploadNameAndAddress({required String name,required String address})async{
  await firebaseFirestore.collection('user').doc(auth.currentUser!.uid).set({
    'name':name,
    'address':address
  });


}
Future getNameAndAddress() async{
  DocumentSnapshot snap= await firebaseFirestore.collection('user').doc(auth.currentUser!.uid).get();

  UserDetailModel user  = UserDetailModel.getModelFromJson((snap.data() as dynamic));
  return user;
}

}