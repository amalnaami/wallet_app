import 'package:flutter/material.dart';
import 'package:wallet_app/services/db_helper.dart';
import 'package:wallet_app/services/needs_db_model.dart';
import 'package:wallet_app/services/spends_db_model.dart';

class SpendDataBaseProvider extends ChangeNotifier {

  List<SpendsModelDb> spendModelDb = [];

  fullList(List<SpendsModelDb> spendModelDb) {
    this.spendModelDb = spendModelDb;

    notifyListeners();
  }

  insertNewSpend(SpendsModelDb spendModelDb) async {
    await DBHelper.taskDBHelper.insertNewSpend(spendModelDb);
    getAllSpend();
  }

  upDateSpend(SpendsModelDb spendModelDb) async {
    // taskModelDb.isImportant = !taskModelDb.isImportant;
    await DBHelper.taskDBHelper.upDataSpend(spendModelDb);
    getAllSpend();
  }

  deleteSpend(SpendsModelDb spendModelDb) async {
    await DBHelper.taskDBHelper.deleteSpends(spendModelDb.taskId);
    getAllSpend();
  }

  getAllSpend() async {
    List<Map<String, dynamic>> listRows =
        await DBHelper.taskDBHelper.selectAllSpends();
    List<SpendsModelDb> spends = listRows != null
        ? listRows.map((e) => SpendsModelDb.fromMap(e)).toList()
        : [];
    fullList(spends);
  }
}
