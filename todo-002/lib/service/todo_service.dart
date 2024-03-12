// ignore_for_file: constant_identifier_names, unused_field, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todollist/model/todo.dart';

const TBL_TODO = "tbl_todolist";

const createTodoTable = """
CREATE TABLE $TBL_TODO (
id TEXT,
sdate TEXT,
stime TEXT,
edate TEXT,
etime TEXT,
content TEXT,
complete INTEGER
)
""";

class TodoService {
  late Database _database;
  // Future<Database> get database() async
  // { database }

  onCreateTable(db, version) async {
    return db.execute(createTodoTable);
  }

// initData/ openDatabase가 실행될 때 version 번호를 비교하여
//새로운 version 번호가 있으면 table의 구조를 변경
  onUpgradeTable(db, oldVersion, newVersion) async {
    if (newVersion > oldVersion) {
      final batch = await db.batch();
      batch.execute("DROP TABLE $TBL_TODO");
      batch.execute(createTodoTable);
      await batch.commit();
    }
  }

  Future<Database> initDatabase() async {
    //스마트 기기의 DB 저장소의 위치를 가져오는 함수
    String dbPath = await getDatabasesPath();
    // 만약 폴더1/2/3/todo.dbf  라는 폴더 경로를 설정할 때
    //운영체제마다 dir seperator 문자가 다르다.
    // 어떤 운영체제는 슬래시(/)를 사용하고
    //어떤 운영체제는 역슬래시(\)를 사용한다.
    //"폴더1" + "\" + "폴더2" + "\" + "폴더3"

    //이 때 path.join이라는 함수를 사용하여 폴더를 결합하면
    //자동으로 운영체제에 맞는 구분자 를 만들어준다.
    String dbFile = join(dbPath, "todo.dbf");
    _database = await openDatabase(
      dbFile,
      onCreate: onCreateTable,
      onUpgrade: onUpgradeTable,
      version: 2,
    );
    return _database;
  }

  Future<Database> get database async {
    _database = await initDatabase();
    return _database;
  }

  insert(Todo todo) async {
    final db = await database;
    debugPrint("INSERT TO : $TBL_TODO ");
    var result = await db.insert(
      TBL_TODO,
      todo.toMap(),
    );
  }

  Future<List<Todo>> selectAll() async {
    final db = await database;
    // final todoList = await db.query((TBL_TODO));
    final List<Map<String, dynamic>> todoList = await db.query(TBL_TODO);
    final result = List.generate(
      todoList.length,
      (index) => Todo.fromMap(todoList[index]),
    );
    return result;
  }

  // selectAll() {}
}
