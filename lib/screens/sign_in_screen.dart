 import 'package:flutter/material.dart';
import 'package:waliamarket/resource/authentication_method.dart';
import 'package:waliamarket/screens/sign_up_screen.dart';
import 'package:waliamarket/utils/utils.dart';
import 'package:waliamarket/widget/custom_primery_button.dart';
import 'package:waliamarket/widget/text_field_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthenticationMethods auth = AuthenticationMethods();
  bool isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

 

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.jpg',
                  height: screenSize.height * 0.25,
                  width: screenSize.width * 1,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  height: screenSize.height * 0.5,
                  width: screenSize.width * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sign-In',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                      ),
                      TextFieldController(
                        title: 'Email',
                        obscure: false,
                        controller: _emailController,
                        hintText: 'Enter Your Email',
                      ),
                      TextFieldController(
                        title: 'Password',
                        obscure: true,
                        controller: _passwordController,
                        hintText: 'Enter Your Password',
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CustomPrimeryButton(
                          child: const Text(
                            'Sign-In',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 6, 6),
                            ),
                          ),
                          isLoading:isLoading,
                          onPressed: ()async {
                            setState(
                              (){
                                isLoading = true;
                              }
                            );
                            String output = await  auth.signIn(
                              
                            email:_emailController.text,
                            password:_passwordController.text
                            );

                             setState(
                              (){
                                isLoading =false;
                              }
                            );
                            if(output =='success'){
                                print('done');
                            }else{

                              Utils().showSnackBar(context: context, content:output);
                              
                            }

                          },
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
               
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                      child: Text('New to Wallia Market?',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                    ),
                    Expanded(
                      child: Container(
                        height:2,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                CustomPrimeryButton(
                  child:Text("Create Walia Account",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 6, 6),
                            ),), 
                  isLoading: false, 
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return SignUpScreen();
                    }));
          
                  }, 
                  color: Colors.black)
              ],
            ),
          ),
        ),
      ),
    );
  }
}