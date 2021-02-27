import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet_app/constant.dart';
import 'package:wallet_app/services/money_gived_provider.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/services/money_model_db.dart';

class MoneyNeedsScreen extends StatefulWidget {
  @override
  _MoneyNeedsScreenState createState() => _MoneyNeedsScreenState();
}

class _MoneyNeedsScreenState extends State<MoneyNeedsScreen> {
  String name;
  String money;

  var _nameController = TextEditingController();
  var _moneyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'أضف ما عليك/لك من دين',
          style: dataStyle.copyWith(color: Colors.white),
        ),
        backgroundColor: deepPurple,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
            size: 26,
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: size.width / 4,
            ),

            Container(
                height: size.width / 7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[200],
                          spreadRadius: 2,
                          offset: Offset(0, 5),
                          blurRadius: 10)
                    ]),
                padding: EdgeInsets.only(right: 10),
                child: TextField(
                  textAlign: TextAlign.right,
                  onChanged: (value) {
                    name = value;
                  },
                  keyboardType: TextInputType.text,
                  controller: _nameController,
                  decoration: InputDecoration(
                      hintText: 'الاسم',
                      hintStyle: dataStyle,
                      border: InputBorder.none),
                )),
            SizedBox(
              height: size.width / 10,
            ),
            Container(
                height: size.width / 7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[200],
                          spreadRadius: 2,
                          offset: Offset(0, 5),
                          blurRadius: 10)
                    ]),
                padding: EdgeInsets.only(right: 10),
                child: TextField(
                  textAlign: TextAlign.right,
                  onChanged: (value) {
                    money = value;
                  },
                  keyboardType: TextInputType.number,
                  controller: _moneyController,
                  decoration: InputDecoration(
                      hintText: 'قيمة المبلغ',
                      hintStyle: dataStyle,
                      border: InputBorder.none),
                )),
            SizedBox(
              height: size.width / 4,
            ),
            InkWell(
              onTap: () async {
                MoneyModelDb moneyModelDb = MoneyModelDb(
                    name: name,
                    money:money,
                );
                await context
                    .read<MoneyProvider>()
                    .insertNewMoney(moneyModelDb);
                Navigator.pop(context);
              },
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: amberColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  width: size.width / 2,
                  child: Text(
                    'اضافة',
                    style:
                        dataStyle.copyWith(fontSize: 24, color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
