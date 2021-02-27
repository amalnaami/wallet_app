import 'package:path_provider/path_provider.dart';

import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:wallet_app/services/needs_db_model.dart';
import 'package:wallet_app/services/spends_db_model.dart';

import 'money_model_db.dart';

class DBHelper {
  DBHelper._();

  static DBHelper taskDBHelper = DBHelper._();
  static final String pathTaskDataBase = 'needs.db';
  static final String tableNeed = 'needs';
  static final String needIdColumn = 'needIdColumn';
  static final String needName = 'needName';
  static final String needPrice = 'needPrice';
  static final String needData = 'needData';
  static final String needCurrency = 'needCurrency';
  static final String needImportant = 'needImportant';
  static final String tableSpends = 'spends';
  static final String spendIdColumn = 'spendIdColumn';
  static final String spendName = 'spendName';
  static final String spendPrice = 'spendPrice';
  static final String spendData = 'spendData';
  static final String spendCurrency = 'spendCurrency';
  static const String name = 'name';
  static const String tableMoney = 'tableMoney';
  static const String money = 'money';
  static final String moneyIdColumn = 'moneyIdColumn';
  Database database;

  initNeedsDataBase() async {
    if (database == null) {
      database = await connectToTaskDataBase();
    }
    return database;
  }

  Future<Database> connectToTaskDataBase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String pathTaskData = join(directory.path, pathTaskDataBase);
    Database database =
        await openDatabase(pathTaskData, version: 2, onCreate: (db, version) {
      createTasksTable(db);
      createSpendTable(db);
      moneyTable(db);
    });
    return database;
  }

  createTasksTable(Database database) {
    database.execute('''CREATE TABLE $tableNeed(
$needIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,
$needName TEXT NOT NULL,
$needData TEXT NOT NULL,
$needPrice TEXT NOT NULL,
$needCurrency TEXT NOT NULL
)''');
  }

  createSpendTable(Database database) {
    database.execute('''CREATE TABLE $tableSpends(
$spendIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,
$spendName TEXT NOT NULL,
$spendData TEXT NOT NULL,
$spendPrice TEXT NOT NULL,
$spendCurrency TEXT NOT NULL
)''');
  }

  moneyTable(Database database) {
    database.execute('''CREATE TABLE $tableMoney(
$moneyIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,
$name TEXT NOT NULL,
$money TEXT NOT NULL
)''');
  }

  insertNewNeed(NeedsModelDb needsModelDb) async {
    try {
      int rowNum = await database.insert(tableNeed, needsModelDb.toMap());
    } on Exception catch (e) {
      print('$e nfvdjzndn');
    }
  }

  Future<List<Map<String, dynamic>>> selectAllNeed() async {
    try {
      List<Map<String, dynamic>> listRows = await database.query(tableNeed);
      return listRows;
    } on Exception catch (e) {
      print('$e 6522222');
    }
  }

  getOneTask(int taskId) async {
    List<Map<String, dynamic>> result = await database
        .query(tableNeed, where: '$needIdColumn=?', whereArgs: [taskId]);
  }

  upDataTask(NeedsModelDb needsModelDb) async {
    database.update(tableNeed, needsModelDb.toMap(),
        where: '$needIdColumn=?', whereArgs: [needsModelDb.taskId]);
  }

  deleteTask(
    int taskId,
  ) async {
    database.delete(tableNeed, where: '$needIdColumn=?', whereArgs: [taskId]);
  }

  deleteAllTasks() async {
    database.delete(tableNeed);
  }

  insertNewSpend(SpendsModelDb spendsModelDb) async {
    try {
      int rowNum = await database.insert(tableSpends, spendsModelDb.toMap());
    } on Exception catch (e) {
      print('$e nfvdjzndn');
    }
  }

  Future<List<Map<String, dynamic>>> selectAllSpends() async {
    try {
      List<Map<String, dynamic>> listRows = await database.query(tableSpends);
      return listRows;
    } on Exception catch (e) {
      print('$e 6522222');
    }
  }

  getOneSpend(int taskId) async {
    List<Map<String, dynamic>> result = await database
        .query(tableSpends, where: '$spendIdColumn=?', whereArgs: [taskId]);
  }

  upDataSpend(SpendsModelDb spendsModelDb) async {
    database.update(tableSpends, spendsModelDb.toMap(),
        where: '$spendIdColumn=?', whereArgs: [spendsModelDb.taskId]);
  }

  deleteSpends(
    int taskId,
  ) async {
    database
        .delete(tableSpends, where: '$spendIdColumn=?', whereArgs: [taskId]);
  }

  deleteAllSpend() async {
    database.delete(tableSpends);
  }

  insertMoney(MoneyModelDb moneyModelDb) async {
    try {
      int rowNum = await database.insert(tableMoney, moneyModelDb.toMap());
    } on Exception catch (e) {
      print('$e nfvdjzndn');
    }
  }

  Future<List<Map<String, dynamic>>> selectMoney() async {
    try {
      List<Map<String, dynamic>> listRows = await database.query(tableMoney);
      return listRows;
    } on Exception catch (e) {
      print('$e 6522222');
    }
  }

  getOneMoney(int moneyId) async {
    List<Map<String, dynamic>> result = await database
        .query(tableMoney, where: '$moneyIdColumn=?', whereArgs: [moneyId]);
  }

  upDataMoney(MoneyModelDb moneyModelDb) async {
    database.update(tableMoney, moneyModelDb.toMap(),
        where: '$moneyIdColumn=?', whereArgs: [moneyModelDb.moneyId]);
  }

  deleteMoney(
    int moneyId,
  ) async {
    database
        .delete(tableMoney, where: '$moneyIdColumn=?', whereArgs: [moneyId]);
  }

  deleteAllMoney() async {
    database.delete(tableMoney);
  }
}
