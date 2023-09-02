import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'homepage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _username = '';
  String _password = "";
  // ignore: unused_field
  String _errorText = '';

  void _validateAndSubmit() {
    if (_username == 'admin' && _password == '1234') {
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => const HomePage()));
    } else {
      setState(() {
        _errorText = 'Username or password is incorrect';
      });
      Timer(const Duration(seconds: 3), () {
        setState(() {
          _errorText = '';
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Column(
                children: [
                  const Text(
                    "Welcome!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 40),
                  ),
                  const Text(
                    " AHH Yaa!!! You back we missed you come check you tasks",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                  Form(
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Container(
                      padding: const EdgeInsets.only(top: 50),
                      width: 350,
                      child: Column(
                        children: [
                          TextFormField(
                            onChanged: (value) => _username = value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(60),
                              ),
                              hintText: "Username, Phone number",
                              contentPadding: const EdgeInsets.only(left: 20),
                            ),
                            autofocus: false,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: TextFormField(
                              onChanged: (value) => _password = value,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                contentPadding: const EdgeInsets.only(left: 20),
                                hintText: "Password",
                              ),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.bottomRight,
                            child: Text("Forgot password?"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.deepOrangeAccent,
                                  borderRadius: BorderRadius.circular(60)),
                              child: TextButton(
                                  onPressed: _validateAndSubmit,
                                  child: const Text(
                                    "Log in",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                          Text(_errorText,
                              style: const TextStyle(color: Colors.red)),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FractionallySizedBox(
                                        widthFactor: 1,
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                          // width: 100,
                                          color: Colors.deepOrangeAccent,
                                          height: 3,
                                        ),
                                      )),
                                ),
                                const Text(
                                  "Or Login with",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FractionallySizedBox(
                                        widthFactor: 1,
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          // width: 100,
                                          height: 3,
                                          color: Colors.deepOrangeAccent,
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    final googleSignIn = GoogleSignIn();

                                    try {
                                      final GoogleSignInAccount? googleUser =
                                          await googleSignIn.signIn();
                                      if (googleUser != null) {
                                        // Google sign-in was successful, you can proceed with further actions
                                        // For example, you can use googleUser.id, googleUser.displayName, etc.
                                      }
                                    } catch (error) {
                                      // Handle errors or cancelations here
                                      print('Google Sign-In Error: $error');
                                    }
                                  },
                                  child: Image.asset(
                                    "assets/images/google.png",
                                    width: 50,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
