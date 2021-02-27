
import 'package:wallet_app/services/db_helper.dart';

class SpendsModelDb {
  String name;
  String data;
  String currency;
  String price;
  int taskId;

  SpendsModelDb({this.name, this.data, this.taskId,this.price,this.currency,});

  SpendsModelDb.fromMap(Map map) {
    this.taskId = map[DBHelper.spendIdColumn];
    this.name = map[DBHelper.spendName];
    this.data = map[DBHelper.spendData];
    this.currency = map[DBHelper.spendCurrency];
    this.price = map[DBHelper.spendPrice];
  }

  Map<String, dynamic> toMap() {
    return {
     DBHelper.spendName: this.name,
     DBHelper.spendData: this.data,
     DBHelper.spendPrice: this.price,
     DBHelper.spendCurrency: this.currency,
    };
  }
}
