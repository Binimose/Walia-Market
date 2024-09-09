import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waliamarket/model/user_detail.dart';
import 'package:waliamarket/provider/user_detial_provider.dart';
import 'package:waliamarket/screens/sell_screen.dart';
import 'package:waliamarket/utils/color_themes.dart';
import 'package:waliamarket/utils/constants.dart';
import 'package:waliamarket/utils/utils.dart';
import 'package:waliamarket/widget/account_screen_app_bar.dart';
import 'package:waliamarket/widget/custom_primery_button.dart';
import 'package:waliamarket/widget/product_List.dart';

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
               ProductsShowcaseListView(title:'Your Order', children: testChildern),
              
              const Text('Requested Orders',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black ,fontSize: 20)),
               Expanded(
                child:ListView.builder(
                  itemCount: 10,
                  
                  itemBuilder:(context,index){
                   return const ListTile(
                    title: Text("Order Block Shoe ",
                    
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                    subtitle: Text("Binyam Somewhere on the earth"),
                   );
                  }
                  )
                
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