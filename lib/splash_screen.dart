import 'package:flutter/material.dart';
import 'package:todoapp/login.dart';
import 'package:todoapp/signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        physics: const ScrollPhysics(),
        children: [
          Container(
            height: 500,
            padding: EdgeInsets.only(top: 180),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                      width: 10,
                      color: Colors.black,
                    )),
                  ),
                  child: Image.asset("assets/images/welcome_img.jpg"),
                ),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Task/Todo List &",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "Management",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w800),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Container(
            // height: 600,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                  child: Container(
                    // padding: EdgeInsets.all(10),

                    color: Colors.deepOrangeAccent,
                    width: 200,

                    // height: 40,
                    child: TextButton(
                      onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (builder) => Login()))
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.all(13),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 1,
                              color: Colors.grey.withOpacity(0.6))
                        ]),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => const SignUp()));
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
