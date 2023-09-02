class SubTaskModel {
  final int? id;
  final String subName;
  final String subStatus;
  final int taskId;

  SubTaskModel({
    this.id,
    required this.subName,
    required this.subStatus,
    required this.taskId,
  });

  factory SubTaskModel.fromJson(Map<String, dynamic> map) {
    return SubTaskModel(
      id: map['id'],
      subName: map['subName'],
      subStatus: map['subStatus'],
      taskId: map['taskId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subName': subName,
      'subStatus': subStatus,
      'taskId': taskId,
    };
  }
}
