import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/create_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var recentlyAdded = [
    {
      "title": "Football Cup",
      "sub-text": "make a choice",
      "tasks": 3,
      "status": "doing",
      "completion": 70
    },
    {
      "title": "Rework Landing",
      "sub-text": "UI work",
      "tasks": 2,
      "status": "due",
      "completion": 80
    },
    {
      "title": "Barber Appointment",
      "sub-text": "personal",
      "tasks": 1,
      "status": "done",
      "completion": 50
    },
    {
      "title": "Scrum Meeting",
      "sub-text": "dribbling training",
      "tasks": 3,
      "status": "doing",
      "completion": 60
    },
    {
      "title": "Home cleaning",
      "sub-text": "personal",
      "tasks": 12,
      "status": "due",
      "completion": 25
    }
  ];

  var statusColors = {
    "pending": Colors.blueGrey,
    "due": Colors.red,
    "doing": Colors.orangeAccent,
    "done": Colors.greenAccent,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/images/short.jpg",
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  width: 270,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: "Hello, ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w500)),
                        TextSpan(
                            text: "Onoja",
                            style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontSize: 30,
                                fontWeight: FontWeight.w500))
                      ])),
                      const Text(
                        "Manage your tasks!",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                    color: Colors.black.withOpacity(0.2))
                              ],
                              borderRadius: BorderRadius.circular(60)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 20,
                                // height: 40,
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 150,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Search",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      contentPadding: EdgeInsets.only(
                                          left: 10, bottom: 10)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                    width: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.more_vert,
                          color: Colors.black,
                          size: 40,
                        ),
                        Image.asset(
                          "assets/images/sort_order.png",
                          width: 35,
                        )
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        physics: const ScrollPhysics(),
        children: [
          const Text(
            "Last added",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recentlyAdded
                  .length, // Update this with the number of items you have
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 153,
                      padding: EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 20,
                            offset: Offset(2, 2),
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 3.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recentlyAdded[index]["title"] as String,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  recentlyAdded[index]["status"] as String,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  " ${recentlyAdded[index]["tasks"]} tasks",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 3,
                            height: 40,
                            color: statusColors[recentlyAdded[index]["status"]],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Tasks List",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
              ),
              ListView.builder(
                  itemCount: recentlyAdded.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var item = recentlyAdded[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                spreadRadius: 1,
                                color: Colors.grey.withOpacity(0.5),
                              )
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 70,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Transform.scale(
                                        scale: 1.5,
                                        child: CircularProgressIndicator(
                                          value: ((item["completion"]! as int) /
                                                  100)
                                              .toDouble(),
                                          backgroundColor:
                                              (statusColors[item["status"]])
                                                  ?.withOpacity(0.2),
                                          color: statusColors[item["status"]],
                                          strokeWidth: 2,
                                        ),
                                      ),
                                      Text(item["completion"] != null
                                          ? item["completion"].toString() + "%"
                                          : ""),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item["title"] as String,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      item["sub-text"] as String,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                                    Text(item["tasks"].toString() + " tasks")
                                  ],
                                )
                              ],
                            ),
                            Container(
                              width: 4,
                              height: 45,
                              color: statusColors[item["status"]],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: 220,
                      decoration: BoxDecoration(
                          color: CupertinoColors.activeBlue,
                          borderRadius: BorderRadius.circular(20)),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => const CreateTask()));
                        },
                        child: const Text(
                          "Create task",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
