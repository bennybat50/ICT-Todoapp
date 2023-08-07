import 'package:flutter/material.dart';
import 'package:todoapp/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 90,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  print("pressed");
                },
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.deepOrangeAccent,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    "assets/images/triangle.png",
                    width: 160,
                    height: 70,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  const Text(
                    "Signup!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 40),
                  ),
                  const Text(
                    '''
On this app, you can perform as many functions
 as we allow  you to. stay glued
 stay here
 ''',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  Form(
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Container(
                      padding: EdgeInsets.only(top: 30),
                      width: 350,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(60),
                              ),
                              hintText: "Username, Phone number",
                              contentPadding: EdgeInsets.only(left: 20),
                            ),
                            autofocus: false,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: "Email"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                contentPadding: EdgeInsets.only(left: 20),
                                hintText: "Password",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.deepOrangeAccent,
                                  borderRadius: BorderRadius.circular(60)),
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
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
                                  "Or signup with",
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
                            padding: EdgeInsets.symmetric(vertical: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  "assets/images/google.png",
                                  width: 50,
                                ),
                                Image.asset(
                                  "assets/images/facebook.png",
                                  width: 50,
                                ),
                                Image.asset(
                                  "assets/images/apple.png",
                                  width: 50,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => const Login()));
                            },
                            child: const Text(
                              "Already a user? Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
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
