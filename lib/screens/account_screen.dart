import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waliamarket/model/order_request_model.dart';
import 'package:waliamarket/model/product_model.dart';
import 'package:waliamarket/model/user_detail.dart';
import 'package:waliamarket/provider/user_detial_provider.dart';
import 'package:waliamarket/screens/sell_screen.dart';
import 'package:waliamarket/utils/color_themes.dart';
import 'package:waliamarket/utils/constants.dart';
import 'package:waliamarket/utils/utils.dart';
import 'package:waliamarket/widget/account_screen_app_bar.dart';
import 'package:waliamarket/widget/custom_primery_button.dart';
import 'package:waliamarket/widget/product_List.dart';
import 'package:waliamarket/widget/simple_product.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return SafeArea(
      child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AccountScreenAppBar(),
      body:SingleChildScrollView(
       child: SizedBox(
        width:screenSize.width,
        height:screenSize.height,
         child:  Column(
            children: [
              IntroductionWidgetAccountScreen(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomPrimeryButton(
                isLoading:false, 
                 onPressed:(){
                  FirebaseAuth.instance.signOut();
                 }, 
                 color:Colors.black,
                child:const Text('Sign Out' ,style:TextStyle(color: Colors.white))
                 ),
              ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: CustomPrimeryButton(
                 isLoading:false, 
                 onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder:(context){
                       return SellScreen();
                    }));
                 }, 
                 color:Colors.black,
                 child:const Text('Sell' ,style:TextStyle(color: Colors.white))
                 ),
               ),

               FutureBuilder(
                future: FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).collection('orders').get(),
                 builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
                     if(snapshot.connectionState == ConnectionState.waiting){
                      return const Center(child: CircularProgressIndicator());
                     }else{
                      List<Widget> childern = [];
                      for(int i = 0 ;i<snapshot.data!.docs.length;i++){
                        ProductModel model = ProductModel.getModelFromJson(json: snapshot.data!.docs[i].data());
                        childern.add( SimpleProductWidget(  productModel: model, ));

                      } return ProductsShowcaseListView(title:'Your Order',
                   
                     children:childern);

                     }
                     

                  }, 
                 )
                ,
              
              const Text('Requested Orders',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black ,fontSize: 20)),
               Expanded(
  child: StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('orderRequests') // Fixed the typo in collection name from 'orderRequesets'
        .snapshots(),
    builder: (context,   AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                              snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
        // Handle the case where there are no order requests
        return const Center(
          child: Text("No order requests found"),
        );
      } else {
        // Proceed if there are documents
        return ListView.builder(
          itemCount: snapshot.data!.docs.length   ,
          itemBuilder: (context, index) {
            OrderRequestModel model = OrderRequestModel.getModelFromJson(
              json: snapshot.data!.docs[index].data(),
            );
            return ListTile(
              title: Text(
                "Order: ${model.orderName}",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text("Address: ${model.buyersAddress}"),
              trailing: IconButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection("Users")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("orderRequests")
                      .doc(snapshot.data!.docs[index].id)
                      .delete();
                },
                icon: Icon(Icons.check),
              ),
            );
          },
        );
      }
    },
  ),
)

      
            ],    
         ),
       ),
      
      ),
      ),
    );
  }
}

class IntroductionWidgetAccountScreen extends StatelessWidget {

  const IntroductionWidgetAccountScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    UserDetailModel? userDetail = Provider.of<UserDetialProvider>(context).userDetail;
    return Container(
      height: kAppBarHeight/2,
      decoration: BoxDecoration(
         gradient: LinearGradient(colors:[yellowColor,Colors.yellow.withOpacity(0.6)],
         begin: Alignment.bottomCenter,
         end: Alignment.topCenter
         )
           
      ),
    child:  Container(
      height: kAppBarHeight/2,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors:[const Color.fromARGB(255, 255, 255, 255),Colors.white.withOpacity(0.5)],
        begin: Alignment.bottomCenter,
         end: Alignment.topCenter
         )
           
      ),
      child:Row(
      
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: RichText(text:TextSpan(
              
              children: [
                const TextSpan(text:'Hello,  ', style: TextStyle(color:Colors.black,fontSize: 20)),
                TextSpan(text:userDetail?.name,style: const TextStyle(color:Colors.black,fontSize: 20,fontWeight:FontWeight.bold))
              ]
            )),
          )
        ],
      )
    
    ),
    );
  }
}