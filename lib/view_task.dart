import 'package:flutter/material.dart';
import 'package:todoapp/database_repo/todoModel.dart';

import 'database_repo/database_repository.dart';
import 'database_repo/subTaskModel.dart';

class ViewTask extends StatefulWidget {
  final TodoModel data;
  const ViewTask({Key? key, required this.data}) : super(key: key);

  @override
  State<ViewTask> createState() => _ViewTaskState();
}

class _ViewTaskState extends State<ViewTask> {
  late TodoModel task;
  var priorityColors = {
    "high": Colors.red,
    "low": Colors.greenAccent,
    "medium": Colors.orangeAccent,
  };
  var forDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        blurRadius: 5,
        spreadRadius: 1,
        color: Colors.grey.withOpacity(0.2),
      )
    ],
  );

  @override
  void initState() {
    task = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${task.taskName}"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              "Priority",
              style: TextStyle(color: Colors.orange),
            ),
            trailing: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                color: priorityColors[task.priority],
                child: Text(
                  "${task.priority}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Start Date",
              style: TextStyle(color: Colors.orange),
            ),
            trailing: Text("${task.startDate}"),
          ),
          ListTile(
            title: Text(
              "End Date",
              style: TextStyle(color: Colors.orange),
            ),
            trailing: Text("${task.endDate}"),
          ),
          Divider(),
          Text(
            "Subtask List",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          FutureBuilder(
              future: getSubTask(data: task.id),
              builder: (context, snap) {
                return ListView.builder(
                    itemCount: snap.data?.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var item = snap.data?[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          decoration: forDecoration,
                          padding: const EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${item?.subName}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                              IconButton(
                                  onPressed: () {
                                    updateSub(item?.id, item!);
                                  },
                                  icon: item?.subStatus == "false"
                                      ? Icon(
                                          Icons.circle,
                                          color: Colors.grey,
                                        )
                                      : Icon(
                                          Icons.check_circle,
                                          color: Colors.grey,
                                        ))
                            ],
                          ),
                        ),
                      );
                    });
              }),
          ListTile(
            title: Text(
              "Description",
              style: TextStyle(color: Colors.orange),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${task.description}"),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    color: Colors.orange,
                    child: Text(
                      "Edit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          ListTile(
            title: Text(
              "Completion Percentage",
              style: TextStyle(color: Colors.orange),
            ),
            subtitle: Container(),
          ),
        ],
      ),
    );
  }

  Future<List<SubTaskModel>> getSubTask({data}) async {
    return await DatabaseRepository.instance.getATaskSubs(int.parse("${data}"));
  }

  void updateSub(int? id, SubTaskModel item) async {
    SubTaskModel subTaskModel = SubTaskModel(
        id: id, subName: item.subName, subStatus: "true", taskId: item.taskId);
    await DatabaseRepository.instance.updateSub(subTaskModel);
    setState(() {});
  }
}
