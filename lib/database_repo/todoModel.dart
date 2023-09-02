class TodoModel {
  final int? id;
  final String taskName;
  final String priority;
  final String startDate;
  final String endDate;
  final String description;
  final String status;

  TodoModel(
      {this.id,
      required this.taskName,
      required this.priority,
      required this.startDate,
      required this.endDate,
      required this.description,
      required this.status});

  factory TodoModel.fromJson(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      taskName: map['taskName'],
      priority: map['priority'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      description: map['description'],
      status: map['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskName': taskName,
      'priority': priority,
      'startDate': startDate,
      'endDate': endDate,
      'description': description,
      'status': status,
    };
  }
}
