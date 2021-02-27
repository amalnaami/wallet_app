
import 'package:wallet_app/services/db_helper.dart';

class NeedsModelDb {
  String name;
  String data;
  String currency;
  String price;
  bool isImportant;
  int taskId;

  NeedsModelDb({this.name, this.data, this.taskId, this.isImportant,this.price,this.currency});

  NeedsModelDb.fromMap(Map map) {
    this.taskId = map[DBHelper.needIdColumn];
    this.name = map[DBHelper.needName];
    this.data = map[DBHelper.needData];
    this.currency = map[DBHelper.needCurrency];
    this.price = map[DBHelper.needPrice];
    // this.isImportant = map[NoteDBHelper.noteImportant] == 1 ? true : false;
  }

  Map<String, dynamic> toMap() {
    return {
     DBHelper.needName: this.name,
     DBHelper.needData: this.data,
     DBHelper.needPrice: this.price,
     DBHelper.needCurrency: this.currency,
     // DBHelper.noteImportant: isImportant ? 1 : 0,
    };
  }
}
