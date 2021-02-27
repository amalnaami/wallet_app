import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/models/add_money.dart';
import 'package:wallet_app/services/money_gived_provider.dart';
import 'package:wallet_app/ui_screen/money_gived_model.dart';
import '../constant.dart';

class MoneyGiveToOther extends StatefulWidget {
  @override
  _MoneyGiveToOtherState createState() => _MoneyGiveToOtherState();
}

class _MoneyGiveToOtherState extends State<MoneyGiveToOther> {
  List<int> price = [];
  var sum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: deepPurple,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              size: 28,
              color: Colors.white,
            ),
          )),
      backgroundColor: Colors.grey[100],
      body: Consumer<MoneyProvider>(builder: (context, value, child) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              decoration: BoxDecoration(
                  color: deepPurple,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('قيمة المبلغ',
                      style: dataStyle.copyWith(color: Colors.white)),
                  Text(
                    'الاسم',
                    style: dataStyle.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.all(20),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    if(!value.moneyModelDb.contains(value.moneyModelDb[index].moneyId)){
                      value.moneyModelDb.forEach((element) {
                        sum += int.parse(element.money.toString());
                        print("Sum : ${sum}");
                        print("Sum : ${sum}");
                      });
                    }

                    // for (var i = 0; i < value.moneyModelDb.length; ++i) {
                    //   price.add(int.parse(value.moneyModelDb[index].money));
                    //
                    //   sum += int.parse(value.moneyModelDb);
                    //   print("Sum : ${sum}");
                    //
                    // }

                    // for (int i  = 1; i < value.moneyModelDb.length; i++) {
                    //  // if(price.contains(int.parse(value.moneyModelDb[i].money))){
                    //     price.add(int.parse(value.moneyModelDb[i].money));
                    //     sum += price[i];
                    //     print('price$price');
                    //     print('sumsum$sum');
                    //   // } else{
                    //   //   print('noooo');
                    //   // }
                    //
                    //
                    //
                    //
                    // }
                    return Column(
                      children: value.moneyModelDb
                          .map((
                            e,
                          ) =>
                              MoneyAddModel(e))
                          .toList(),
                    );
                  }),
            ),
          ],
        );
      }),
      floatingActionButton: InkWell(
        onTap: () {
          setState(() {
            sum=0;
          });
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MoneyNeedsScreen()));
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: deepAmber,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  spreadRadius: 4,
                  offset: Offset(0, 8),
                  blurRadius: 15,
                )
              ]),
          margin: EdgeInsets.only(bottom: 25),
          child: Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
