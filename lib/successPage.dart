import "package:flutter/material.dart";
import "package:todoapp/homepage.dart";

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: FractionallySizedBox(
              heightFactor: 1,
              child: Container(
                  color: Colors.deepOrangeAccent.withOpacity(0.5),
                  child: Column(
                    children: [
                      Expanded(
                        child: FractionallySizedBox(
                          heightFactor: 0.6,
                          widthFactor: 1,
                          alignment: Alignment.topCenter,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent.withOpacity(0.8),
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(100),
                                    bottomRight: Radius.circular(100))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 50),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(width: 8))),
                                      child: Image.asset(
                                        "assets/images/welcome_img.jpg",
                                        // width: 250,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        "Success!",
                                        style: TextStyle(
                                          letterSpacing: 4,
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "You new task has been successfully created",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Colors.white.withOpacity(0.7),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 100,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => const HomePage()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: const Text(
                              "Continue",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
