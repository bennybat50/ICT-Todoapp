import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/database_repo/subTaskModel.dart';
import 'package:todoapp/homepage.dart';

import 'database_repo/database_repository.dart';
import 'database_repo/todoModel.dart';
import 'utilities/app_actions.dart';

class UpdateTask extends StatefulWidget {
  final TodoModel data;
  const UpdateTask({Key? key, required this.data}) : super(key: key);

  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  var subTasks = [];
  var subTaskName = TextEditingController();
  var taskName = TextEditingController();
  var taskDescp = TextEditingController();
  var startDate = TextEditingController();
  var taskDate = TextEditingController();
  bool editSub = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> _subformKey = GlobalKey<FormState>();
  DateTime _selectedDateTime = DateTime.now();
  var priority = "";
  late TodoModel task;
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
    subTaskName.text = widget.data.taskName;
    taskDescp.text = widget.data.description;
    taskDate.text = widget.data.endDate;

    subTaskName.addListener(() {
      setState(() {
        if (subTaskName.text.length > 1) {
          editSub = true;
        } else {
          editSub = false;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: .3,
          backgroundColor: Colors.white,
          leading: BackButton(
            color: Colors.orange,
          ),
          title: Text(
            "Create New Task",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          )),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: const Text(
                          "Main Task Name",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        decoration: forDecoration,
                        child: TextFormField(
                          controller: taskName,
                          decoration: const InputDecoration(
                            hintText: "UI/UX App Design",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: const Text(
                          "Start Date",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        decoration: forDecoration,
                        child: InkWell(
                          onTap: () {
                            AppActions().showAppDialog(context,
                                title: "Select Start Date",
                                descp:
                                    "Please select the time you will complete this task.",
                                child: Container(
                                    height: MediaQuery.of(context)
                                            .copyWith()
                                            .size
                                            .height /
                                        3,
                                    child: CupertinoDatePicker(
                                      initialDateTime: DateTime.now(),
                                      onDateTimeChanged: (DateTime newdate) {
                                        setState(() {
                                          startDate.text = newdate.toString();
                                          _selectedDateTime = newdate;
                                        });
                                      },
                                      use24hFormat: false,
                                      maximumDate: new DateTime(2029, 12, 30),
                                      minimumYear: 2022,
                                      maximumYear: 2029,
                                      minuteInterval: 1,
                                      mode: CupertinoDatePickerMode.dateAndTime,
                                    )), okAction: () async {
                              Navigator.pop(context);
                            }, okText: "Confirm", cancleText: "Cancel");
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: startDate,
                                    enabled: false,
                                    decoration: const InputDecoration(
                                      hintText: "2022-08-12",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 20,
                                        horizontal: 20,
                                      ),
                                    ),
                                    keyboardType: TextInputType.datetime,
                                  ),
                                ),
                                const Icon(
                                  Icons.calendar_month,
                                  color: Colors.deepOrangeAccent,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: const Text(
                          "Due Date",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        decoration: forDecoration,
                        child: InkWell(
                          onTap: () {
                            AppActions().showAppDialog(context,
                                title: "Select Due Date",
                                descp:
                                    "Please select the time you will complete this task.",
                                child: Container(
                                    height: MediaQuery.of(context)
                                            .copyWith()
                                            .size
                                            .height /
                                        3,
                                    child: CupertinoDatePicker(
                                      initialDateTime: DateTime.now(),
                                      onDateTimeChanged: (DateTime newdate) {
                                        setState(() {
                                          taskDate.text = newdate.toString();
                                          _selectedDateTime = newdate;
                                        });
                                      },
                                      use24hFormat: false,
                                      maximumDate: new DateTime(2029, 12, 30),
                                      minimumYear: 2022,
                                      maximumYear: 2029,
                                      minuteInterval: 1,
                                      mode: CupertinoDatePickerMode.dateAndTime,
                                    )), okAction: () async {
                              Navigator.pop(context);
                            }, okText: "Confirm", cancleText: "Cancel");
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: taskDate,
                                    enabled: false,
                                    decoration: const InputDecoration(
                                      hintText: "2022-08-12",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 20,
                                        horizontal: 20,
                                      ),
                                    ),
                                    keyboardType: TextInputType.datetime,
                                  ),
                                ),
                                const Icon(
                                  Icons.calendar_month,
                                  color: Colors.deepOrangeAccent,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.only(top: 20, bottom: 5, left: 10),
                        child: const Text(
                          "Choose priority",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                priority = "high";
                                setState(() {});
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                decoration: BoxDecoration(
                                  color: priority == "high"
                                      ? Colors.red
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: const Text(
                                  "High",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                priority = "medium";
                                setState(() {});
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                decoration: BoxDecoration(
                                  color: priority == "medium"
                                      ? Colors.orangeAccent
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: const Text(
                                  "Medium",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                priority = "low";
                                setState(() {});
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                decoration: BoxDecoration(
                                  color: priority == "low"
                                      ? Colors.greenAccent
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: const Text(
                                  "Low",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  ListView.builder(
                      itemCount: subTasks.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var item = subTasks[index];
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
                                  "$item",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: 16),
                                ),
                                IconButton(
                                    onPressed: () {
                                      deleteSub(index);
                                    },
                                    icon: Icon(Icons.delete))
                              ],
                            ),
                          ),
                        );
                      }),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.only(top: 20, bottom: 5, left: 10),
                        child: const Text(
                          "Sub-task name",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Form(
                        key: _subformKey,
                        child: Container(
                          decoration: forDecoration,
                          child: TextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            onEditingComplete: () {
                              validateSub();
                            },
                            controller: subTaskName,
                            decoration: const InputDecoration(
                              hintText: "Enter Subtask Name",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          validateSub();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            color: editSub
                                ? Colors.deepOrange
                                : Colors.deepOrange.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const Text(
                            "Add sub-task",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.only(top: 20, bottom: 5, left: 10),
                        child: const Text(
                          "Description",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        constraints: const BoxConstraints(minHeight: 100),
                        decoration: forDecoration,
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: "Enter a description",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    // width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: FractionallySizedBox(
                          widthFactor: 0.9,
                          child: InkWell(
                            onTap: () {
                              validateTaks();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: const Text(
                                "Add task",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        )),
                        Expanded(
                            child: FractionallySizedBox(
                          widthFactor: 0.9,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Text(
                              "Clear",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  validateTaks() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      FocusScope.of(context).unfocus();
      addTask();
    }
  }

  validateSub() async {
    if (_subformKey.currentState!.validate()) {
      _subformKey.currentState!.save();
      FocusScope.of(context).unfocus();
      addSubtask();
    }
  }

  addSubtask() {
    subTasks.add(subTaskName.text);
    subTaskName.text = "";
    setState(() {});
  }

  deleteSub(index) {
    subTasks.removeAt(index);
    setState(() {});
  }

  addTask() async {
    TodoModel todoData = TodoModel(
        taskName: taskName.text,
        description: taskDescp.text,
        status: "pending",
        startDate: DateTime.now().toString(),
        endDate: _selectedDateTime.toString(),
        priority: priority);
    var taskID = await DatabaseRepository.instance.insert(todomodel: todoData);

    subTasks.forEach((element) {
      SubTaskModel subTaskModel = SubTaskModel(
          subName: element, subStatus: "false", taskId: int.parse("$taskID"));
      DatabaseRepository.instance.insertSub(subTaskModel: subTaskModel);
    });
    AppActions()
        .showSuccessToast(context: context, text: "Task Added Successfully");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        ModalRoute.withName(''));
  }
}
