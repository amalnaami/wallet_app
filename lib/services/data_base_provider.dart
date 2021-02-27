import 'package:flutter/material.dart';
import 'package:wallet_app/services/db_helper.dart';
import 'package:wallet_app/services/needs_db_model.dart';

class DataBaseProvider extends ChangeNotifier {
  List<NeedsModelDb> needModelDb = [];

  fullList(List<NeedsModelDb> needModelDb) {
    this.needModelDb = needModelDb;

    notifyListeners();
  }

  insertNewNeeds(NeedsModelDb needsModelDb) async {
    await DBHelper.taskDBHelper.insertNewNeed(needsModelDb);
    getAllNeeds();
  }

  upDateNeeds(NeedsModelDb needsModelDb) async {
    // taskModelDb.isImportant = !taskModelDb.isImportant;
    await DBHelper.taskDBHelper.upDataTask(needsModelDb);
    getAllNeeds();
  }

  deleteNeeds(NeedsModelDb needsModelDb) async {
    await DBHelper.taskDBHelper.deleteTask(needsModelDb.taskId);
    getAllNeeds();
  }

  getAllNeeds() async {
    List<Map<String, dynamic>> listRows =
        await DBHelper.taskDBHelper.selectAllNeed();
    List<NeedsModelDb> needs = listRows != null
        ? listRows.map((e) => NeedsModelDb.fromMap(e)).toList()
        : [];
    fullList(needs);
  }
}
