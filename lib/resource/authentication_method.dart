

import 'package:firebase_auth/firebase_auth.dart';
import 'package:waliamarket/model/user_detail.dart';


class  AuthenticationMethods {

FirebaseAuth Auth = FirebaseAuth.instance;


Future<String> signUp({
  required String name,
  required String address,
  required String email,
  required String password,
}) async{
  name.trim();
  email.trim();
  address.trim();
  password.trim();

  String output = 'somrthing went Wrong';

   {
    if(name != '' && email != '' && password!= '' && address != ''){
      try{
    await Auth.createUserWithEmailAndPassword(email: email, password: password);
    output = 'success';
    UserDetail user = UserDetail(name: name, address: address);
  
  } on FirebaseAuthException  catch(e){
    output = e.message.toString();

  }
    }else{
      output = 'Please Fill up all The Fields';
    }


 return output;
   }
}

Future<String> signIn({
  required String email,
  required String password,
}) async{
  
  email.trim();
 
  password.trim();

  String output = 'somrthing went Wrong';

   {
    if( email != '' && password!= ''){
      try{
    await Auth.signInWithEmailAndPassword(email: email, password: password);
    output = 'success';
  
  
  } on FirebaseAuthException  catch(e){
    output = e.message.toString();

  }
    }else{
      output = 'Please Fill up all The Fields';
    }


 return output;
   }
}




}