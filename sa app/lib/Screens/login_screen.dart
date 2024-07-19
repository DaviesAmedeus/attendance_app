import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:sa_app/components/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_services.dart';
import '../constants/constants.dart';
import 'home2.dart';


ApiServices apiServices = ApiServices();

class LoginScreen extends StatefulWidget {
  static String id = '/getStartedScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ApiServices? apiServices;
  bool obsecureText = true;
  // final String url = '/api/api/login/';
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late SharedPreferences prefs;


  @override
  void initState() {
    // TODO: implement initState
    // apiServices = ApiServices();
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async{
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(
                height: 190,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: kLargeTextStyle.copyWith(color: Colors.teal),
                  ),
                  Icon(Icons.login, size: 100.0, color: kGreenColor,)
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    ///Username Textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.teal),
                        controller: userNameController,
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Username Field must not be empty';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.person_2_rounded,
                            color: Colors.teal,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                                width: 2, color: Colors.teal),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),

                          ),
                          hintText: 'Enter username',
                          hintStyle: const TextStyle(color: Colors.teal),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    ///Password Textfield
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 20),
                    //   child: TextFormField(
                    //     style: const TextStyle(color: Colors.teal),
                    //     controller: userPasswordController,
                    //     obscureText: obsecureText,
                    //     validator: (input) {
                    //       if (input!.isEmpty) {
                    //         return 'Password Field must not be empty';
                    //       } else if (input.length < 3) {
                    //         return 'Password must be of 8 or more digit';
                    //       }
                    //       else {
                    //         return null;
                    //       }
                    //     },
                    //     decoration: InputDecoration(
                    //       prefixIcon: const Icon(
                    //         Icons.lock_outline_sharp,
                    //         color: Colors.teal,
                    //       ),
                    //       suffixIcon: InkWell(
                    //           onTap: () {
                    //             setState(() {
                    //               obsecureText = !obsecureText;
                    //             });
                    //           },
                    //           child: obsecureText
                    //               ? const Icon(
                    //             Icons.visibility_off,
                    //             color: Colors.teal,
                    //           )
                    //               : const Icon(
                    //             Icons.visibility,
                    //             color: Colors.teal,
                    //           )),
                    //       enabledBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(20.0),
                    //         borderSide: const BorderSide(
                    //             width: 2, color: Colors.teal),
                    //       ),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(20.0),
                    //
                    //       ),
                    //       hintText: 'Enter Password',
                    //       hintStyle: const TextStyle(color: Colors.teal),
                    //     ),
                    //   ),
                    // ),

                    ///Button to login
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: MaterialButton(
                        elevation: 5,
                        color: Colors.green,
                        height: 50,
                        minWidth: 500,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        onPressed: () async{

                          if (_validate()) {

                              String username = userNameController.text;


                              var response = await apiServices.usernameLoginRequest( api:'/api/api/student/$username/', context:context);
                              if (response != null) {
                                var body = json.decode(response.body);

                                print('--------------------BODY----------------------------');
                                print(body);
                                print('----------------------------------------------------');

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) => HomePage2Screen(
                                            name: body['name'],
                                          username: body['USN'],
                                            )));
                              }





                          }

                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              )
              // Icon(Icons.app_registration, size: 45, color: Colors.white,),
            ],
          ),
        ),
      ),
    );
  }

  bool _validate() {
    if (_formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }


}


