import 'package:wallet_app/services/db_helper.dart';

class MoneyModelDb {
  String name;
  String money;
  int moneyId;

  MoneyModelDb({this.name, this.moneyId, this.money});

  MoneyModelDb.fromMap(Map map) {
    this.moneyId = map[DBHelper.moneyIdColumn];
    this.name = map[DBHelper.name];
    this.money = map[DBHelper.money];
  }

  Map<String, dynamic> toMap() {
    return {
      DBHelper.name: this.name,
      DBHelper.money: this.money,
    };
  }
}
