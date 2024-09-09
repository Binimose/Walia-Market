import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:waliamarket/provider/user_detial_provider.dart';
import 'package:waliamarket/resource/cloud_firestore.dart';
import 'package:waliamarket/utils/utils.dart';
import 'package:waliamarket/widget/custom_primery_button.dart';
import 'package:waliamarket/widget/text_field_widget.dart';

class SellScreen extends StatefulWidget {

  const SellScreen({super.key});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  bool isLoading = false;

  int Selected =1;
  Uint8List? image;

  TextEditingController nameController = TextEditingController();

  TextEditingController CostController = TextEditingController();
  List<int> KeysForDiscount =[0,70,60,50];
  

@override
void dispose(){
  nameController.dispose();
  CostController.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
  Size screenSize = Utils().getScreenSize();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            
             Stack(
              children: [
                image == null ?Center(
                  
                  child: Image.network("https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png" ,height: screenSize.height/10,)) :Center(child: Image.memory(image!,height: screenSize.height/10)),
        
                Center(
                  child: IconButton(
                    onPressed: ()async{
                      Uint8List? selectedImage = await Utils().imagePicker(ImageSource.gallery);
                          
                      if(selectedImage !=null){
                        
                        setState(() {
                          image = selectedImage;
                        });
                          
                          
                          
                      }
                    },
                     icon: Icon(Icons.file_upload,color: Colors.black,)
                     ),
                )
              ],
             ),
                    Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 35, vertical: 10),
                              height: screenSize.height * 0.7,
                              width: screenSize.width * 0.7,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                  
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 TextFieldController(
                                      title: "Name",
                                      controller: nameController,
                                      obscure: false,
                                      hintText: "Enter the name of the item"),
                                  TextFieldController(
                                      title: "Cost",
                                      controller: CostController,
                                      obscure: false,
                                      hintText: "Enter the cost of the item"),
                                  const Text(
                                    "Discount",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 17),
                                  ),
                                  ListTile(
                                    title: Text("None"),
                                    leading: Radio(
                                      value: 1,
                                      groupValue: Selected,
                                      onChanged: (int? i) {
                                        setState(() {
                                          Selected = i!;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: Text("70%"),
                                    leading: Radio(
                                      value: 2,
                                      groupValue: Selected,
                                      onChanged: (int? i) {
                                        setState(() {
                                          Selected = i!;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: Text("60%"),
                                    leading: Radio(
                                      value: 3,
                                      groupValue: Selected,
                                      onChanged: (int? i) {
                                        setState(() {
                                          Selected = i!;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: Text("50%"),
                                    leading: Radio(
                                      value: 4,
                                      groupValue: Selected,
                                      onChanged: (int? i) {
                                        setState(() {
                                          Selected = i!;
                                        });
                                      },
                                    ),
                                  ),
                                  


                                ],
                                 
                                
                              ),
                            ),
                            SizedBox(height: 10,),
                                 CustomPrimeryButton(isLoading:false, onPressed: ()async{
                                 String output = await CloudFireStorre().uploadProductToDatabase(
                                    image: image, productName:nameController.text, rawCost:CostController.text, discount:KeysForDiscount[Selected-1], sellerName:Provider.of<UserDetialProvider>(context,listen: false).userDetail!.name, sellerUid: FirebaseAuth.instance.currentUser!.uid);

                                    if(output == 'success'){
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Product uploaded successfully')));
                                    }else{
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to upload product')));
                                    
                                    
                                    }
                                        



                                  }, color:Colors.black, child:const Text('Sell', style:TextStyle(color:Color.fromARGB(255, 255, 253, 253)),)
                                  
                                  
                                  ),
                                  SizedBox(height: 10,),
                                  CustomPrimeryButton(isLoading:false, onPressed: (){
                                    Navigator.pop(context);

                                  }, color:const Color.fromARGB(255, 255, 255, 255), child:const Text('Back', style:TextStyle(color:Colors.black),)
                                  
                                  
                                  ), 
        
          ],
        ),
      ),
    );
  }
}