import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/create_task.dart';
import 'package:todoapp/database_repo/subTaskModel.dart';
import 'package:todoapp/utilities/next_page.dart';
import 'package:todoapp/view_task.dart';

import 'database_repo/database_repository.dart';
import 'database_repo/todoModel.dart';

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

  List<TodoModel> myTodos = [];

  var statusColors = {
    "pending": Colors.blueGrey,
    "due": Colors.red,
    "doing": Colors.orangeAccent,
    "done": Colors.greenAccent,
  };
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        physics: const ScrollPhysics(),
        children: [
          ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            leading: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  "assets/images/short.jpg",
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            title: RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: "Hello, ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500)),
              TextSpan(
                  text: "Onoja",
                  style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 25,
                      fontWeight: FontWeight.w500))
            ])),
            subtitle: const Text(
              "Manage your tasks!",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 270,
                  child: Padding(
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
                                color: Colors.grey.withOpacity(0.2))
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
                                  contentPadding:
                                      EdgeInsets.only(left: 10, bottom: 10)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.sort,
                    color: Colors.black,
                    size: 20,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          const Text(
            "Last added",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 60,
            child: FutureBuilder(
              initialData: myTodos,
              future: getTodos(),
              builder: (context, snap) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snap.data!
                      .length, // Update this with the number of items you have
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 140,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: Colors.grey.withOpacity(0.1)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  color: Colors.grey.withOpacity(0.8)),
                            ],
                          ),
                          child: InkWell(
                            onTap: () {
                              NextPage().nextRoute(
                                  context,
                                  ViewTask(
                                    data: snap.data![index],
                                  ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 3.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 110,
                                          child: Text(
                                            "${snap.data![index].taskName}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "${snap.data![index].status.toString().toUpperCase()}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10,
                                            color: statusColors[
                                                snap.data![index].status],
                                          ),
                                        ),
                                      ),
                                      FutureBuilder(
                                          future: getSubTask(
                                              data: snap.data?[index].id),
                                          builder: (context, snap) {
                                            print(snap.data);
                                            return Text(
                                                "${snap.data?.length} Tasks",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                ));
                                          })
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 3,
                                  height: 40,
                                  color: statusColors[snap.data![index].status],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "Tasks List",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          FutureBuilder(
              initialData: myTodos,
              future: getTodos(),
              builder: (context, snapData) {
                return ListView.builder(
                    itemCount: snapData.data?.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var item = recentlyAdded[index];
                      return InkWell(
                        onTap: () {
                          NextPage().nextRoute(
                              context,
                              ViewTask(
                                data: snapData.data![index],
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                    color: Colors.grey.withOpacity(0.1),
                                  )
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 70,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Transform.scale(
                                            scale: 1.5,
                                            child: CircularProgressIndicator(
                                              value: ((item["completion"]!
                                                          as int) /
                                                      100)
                                                  .toDouble(),
                                              backgroundColor: (statusColors[
                                                      snapData
                                                          .data?[index].status])
                                                  ?.withOpacity(0.2),
                                              color: statusColors[
                                                  snapData.data?[index].status],
                                              strokeWidth: 2,
                                            ),
                                          ),
                                          Text(item["completion"] != null
                                              ? item["completion"].toString() +
                                                  "%"
                                              : ""),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapData.data![index].taskName,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16),
                                        ),
                                        FutureBuilder(
                                            future: getSubTask(
                                                data: snapData.data?[index].id),
                                            builder: (context, snap) {
                                              print(snap.data);
                                              return Text(
                                                  "${snap.data?.length} Tasks");
                                            })
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
                        ),
                      );
                    });
              }),
        ],
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: 120,
        decoration: BoxDecoration(
            color: CupertinoColors.activeBlue,
            borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => const CreateTask()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Create Task",
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
              Icon(
                Icons.add,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<List<TodoModel>> getTodos() async {
    return await DatabaseRepository.instance
        .getAllTodos()
        .catchError((e) => debugPrint(e.toString()));
  }

  Future<List<SubTaskModel>> getSubTask({data}) async {
    return await DatabaseRepository.instance.getATaskSubs(int.parse("${data}"));
  }

  void deleteData(TodoModel todo) async {
    DatabaseRepository.instance.delete(todo.id!).then((value) {
      getTodos();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Deleted')));
    }).catchError((e) {
      print(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Error Deleting data")));
    });
  }
}
