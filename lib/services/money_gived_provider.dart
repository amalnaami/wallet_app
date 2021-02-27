import 'package:flutter/material.dart';
import 'package:wallet_app/services/db_helper.dart';
import 'package:wallet_app/services/money_model_db.dart';

class MoneyProvider extends ChangeNotifier {
  List<MoneyModelDb> moneyModelDb = [];

  fullList(List<MoneyModelDb> moneyModelDb) {
    this.moneyModelDb = moneyModelDb;

    notifyListeners();
  }

  insertNewMoney(MoneyModelDb moneyModelDb) async {
    await DBHelper.taskDBHelper.insertMoney(moneyModelDb);
    getAllMoney();
  }

  upDateMoney(MoneyModelDb moneyModelDb) async {
    // taskModelDb.isImportant = !taskModelDb.isImportant;
    await DBHelper.taskDBHelper.upDataMoney(moneyModelDb);
    getAllMoney();
  }

  deleteMoney(MoneyModelDb moneyModelDb) async {
    await DBHelper.taskDBHelper.deleteMoney(moneyModelDb.moneyId);
    getAllMoney();
  }

  getAllMoney() async {
    List<Map<String, dynamic>> listRows =
        await DBHelper.taskDBHelper.selectMoney();
    List<MoneyModelDb> money = listRows != null
        ? listRows.map((e) => MoneyModelDb.fromMap(e)).toList()
        : [];
    fullList(money);
  }
}
