import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:waliamarket/model/product_model.dart';
import 'package:waliamarket/model/user_detail.dart';
import 'package:waliamarket/utils/utils.dart';
import 'package:waliamarket/widget/simple_product.dart';

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
Future<String>uploadProductToDatabase({
  required Uint8List? image,
  required String productName,
  required String rawCost,
  required int discount,
  required String sellerName,
  required String sellerUid
})async{
  productName.trim();
  rawCost.trim();
  String output = 'Something went wrong';

  if(image != null && productName !="" && rawCost != ''){
     try{

        String uid = Utils().getUid();
        String url = await uploadImageToDatabase(image: image, uid: uid);
        double cost = double.parse(rawCost);
        cost = cost - (cost*discount/100);
        ProductModel product =
        ProductModel
        (url: url,
        productName: productName,
         cost: cost, 
         discount: discount,
          uid: uid, 
          sellerName: sellerName,
          sellerUid: sellerUid,
           rating: 5,
           noOfRating: 0
           );

           await firebaseFirestore.collection('product').doc().set(product.getJson());
           output = 'success';



     }on FirebaseException catch(e){
      output = e.toString();

     } 
      
  }else{
      output = 'Please fill all the fields';
     }
       return output;

}

Future<String> uploadImageToDatabase({required Uint8List image,required String uid})async{

  Reference reference = FirebaseStorage.instance.ref().child('product').child(uid);
  UploadTask uploadTask = reference.putData(image);
  TaskSnapshot task = await uploadTask;
  return task.ref.getDownloadURL();
}

Future getProductFromDiscount(int discount)async{
  List<Widget> children=[];
  QuerySnapshot<Map<String, dynamic>> snap = await firebaseFirestore
  .collection('product')
  .where('discount',isEqualTo:discount).get();
  for(int i =0;i<snap.docs.length;i++){
    DocumentSnapshot docSnap = snap.docs[i];
    ProductModel product = ProductModel.getModelFromJson(json:docSnap.data()as dynamic);

    children.add(SimpleProductWidget(productModel:product));

  }
  return children;
}


}