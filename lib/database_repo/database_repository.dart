import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/database_repo/subTaskModel.dart';

import 'todoModel.dart';

class AppConst {
  static const String tableName = 'todoTable';
  static const String id = 'id';
  static const String taskName = 'taskName';
  static const String startDate = 'startDate';
  static const String priority = 'priority';
  static const String endDate = 'endDate';
  static const String description = 'description';
  static const String status = 'status';

  static const String tableSubName = 'subTaskTable';
  static const String subid = 'id';
  static const String subName = 'subName';
  static const String subStatus = 'subStatus';
  static const String taskId = 'taskId';
}

class DatabaseRepository {
  Database? _database;

  static final DatabaseRepository instance = DatabaseRepository._init();

  DatabaseRepository._init();

  Future<Database> get todoDatabase async {
    if (_database != null) return _database!;
    _database = await _initDB('todo_list.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
create table ${AppConst.tableName} ( 
  ${AppConst.id} integer primary key autoincrement, 
  ${AppConst.taskName} text not null,
  ${AppConst.priority} text not null,
  ${AppConst.startDate} text not null,
  ${AppConst.endDate} text not null,
   ${AppConst.status} text not null,
  ${AppConst.description} text not null)
''');

    await db.execute('''
create table ${AppConst.tableSubName} ( 
  ${AppConst.subid} integer primary key autoincrement, 
  ${AppConst.subName} text not null,
  ${AppConst.subStatus} text not null,
  ${AppConst.taskId} integer not null)
''');
  }

  // GLOBAL FUNCTION

  // TO INSERT DATA INTO THE DATABASE
  Future insert({required TodoModel todomodel}) async {
    var response;
    try {
      final db = await todoDatabase;
      response = await db.insert(AppConst.tableName, todomodel.toMap());
      print(response);
    } catch (e) {
      print(e.toString());
    }
    return response;
  }

  //TO RETERIVE DATA FROM THE DATABASE
  Future<List<TodoModel>> getAllTodos() async {
    final db = await instance.todoDatabase;

    final result = await db.query(AppConst.tableName);

    return result.map((json) => TodoModel.fromJson(json)).toList();
  }

  Future<void> delete(int id) async {
    try {
      final db = await instance.todoDatabase;
      await db.delete(
        AppConst.tableName,
        where: '${AppConst.id} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> update(TodoModel todo) async {
    try {
      final db = await instance.todoDatabase;
      db.update(
        AppConst.tableName,
        todo.toMap(),
        where: '${AppConst.id} = ?',
        whereArgs: [todo.id],
      );
    } catch (e) {
      print(e.toString());
    }
  }

  // TO INSERT DATA INTO SUBTASK TABLE
  Future<void> insertSub({required SubTaskModel subTaskModel}) async {
    try {
      final db = await todoDatabase;
      db.insert(AppConst.tableSubName, subTaskModel.toMap());
    } catch (e) {
      print(e.toString());
    }
  }

  //TO RETERIVE DATA FROM SUBTASK DATABASE
  Future<List<SubTaskModel>> getAllSubs() async {
    final db = await instance.todoDatabase;

    final result = await db.query(AppConst.tableSubName);

    return result.map((json) => SubTaskModel.fromJson(json)).toList();
  }

  //TO RETERIVE DATA FROM SUBTASK DATABASE
  Future<List<SubTaskModel>> getATaskSubs(id) async {
    final db = await instance.todoDatabase;

    final result = await db.query(
      AppConst.tableSubName,
      where: '${AppConst.taskId} = ?',
      whereArgs: ["$id"],
    );

    return result.map((json) => SubTaskModel.fromJson(json)).toList();
  }

  Future<void> deleteSub(int id) async {
    try {
      final db = await instance.todoDatabase;
      await db.delete(
        AppConst.tableSubName,
        where: '${AppConst.subid} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateSub(SubTaskModel subTaskModel) async {
    try {
      final db = await instance.todoDatabase;
      db.update(
        AppConst.tableSubName,
        subTaskModel.toMap(),
        where: '${AppConst.subid} = ?',
        whereArgs: [subTaskModel.id],
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
