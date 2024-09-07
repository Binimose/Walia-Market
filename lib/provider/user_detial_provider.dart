
import 'package:flutter/material.dart';
import 'package:waliamarket/model/user_detail.dart';
import 'package:waliamarket/resource/cloud_firestore.dart';

class UserDetialProvider with ChangeNotifier {
UserDetailModel? userDetail ;

UserDetialProvider():userDetail = UserDetailModel(name:'Loading...', address:'Loading....');

Future getData() async{

 userDetail = await CloudFireStorre().getNameAndAddress();
 notifyListeners();
}

}
