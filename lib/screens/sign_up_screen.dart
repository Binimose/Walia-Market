 

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waliamarket/resource/authentication_method.dart';
import 'package:waliamarket/screens/sign_in_screen.dart';
import 'package:waliamarket/utils/utils.dart';
import 'package:waliamarket/widget/custom_primery_button.dart';
import 'package:waliamarket/widget/text_field_widget.dart';

 

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isLoading = false;
  AuthenticationMethods auth = AuthenticationMethods();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _addressController.dispose();
    _nameController.dispose();
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.jpg',
                    height: screenSize.height * 0.1,
                    width: screenSize.width * 0.7,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.7,
                    child: FittedBox(
                      child: Container(
                        padding: EdgeInsets.all(25),
                        width: screenSize.width * 0.9,
                        height: screenSize.height * 0.85,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sign-Up',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
                            ),
                            TextFieldController(
                              title: 'Name',
                              obscure: false,
                              controller: _nameController,
                              hintText: 'Enter Your Name',
                            ),
                            TextFieldController(
                              title: 'Address',
                              obscure: false,
                              controller: _addressController,
                              hintText: 'Enter Your Address',
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
                                  'Sign-Up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 6, 6),
                                  ),
                                ),
                                isLoading: _isLoading,
                                onPressed: () async {
                                  setState(() {
                                    _isLoading = true;
                                  });

                                  String output = await auth.signUp(
                                    name: _nameController.text,
                                    address: _addressController.text,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  );

                                  setState(() {
                                    _isLoading = false;
                                  });

                                  if (output == "success") {
                                    print('Done');
                                  } else {
                                    // Show error message
                                  Utils().showSnackBar(context: context, content:output);
                                  }
                                },
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                        child: Text(
                          'Already have an account?',
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 2,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  CustomPrimeryButton(
                    child: Text(
                      "Sign-In",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 6, 6),
                      ),
                    ),
                    isLoading: false,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return SignInScreen();
                      }));
                    },
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}