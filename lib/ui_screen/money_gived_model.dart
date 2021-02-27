import 'package:flutter/material.dart';
import 'package:wallet_app/constant.dart';
import 'package:wallet_app/services/money_gived_provider.dart';
import 'package:wallet_app/services/money_model_db.dart';
import 'package:provider/provider.dart';
class MoneyAddModel extends StatelessWidget {
  MoneyModelDb moneyModelDb;

  MoneyAddModel(this.moneyModelDb);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    moneyModelDb.name,
                    style: dataStyle.copyWith(fontWeight: FontWeight.normal),
                  ),
                  InkWell(
                    onTap: () async {
                      await context.read<MoneyProvider>().deleteMoney(moneyModelDb);
                    },
                    child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.close,
                          size: 18,
                          color: Colors.white,
                        )),
                  ),
                  Text(
                    moneyModelDb.money,
                    style: dataStyle.copyWith(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16,bottom: 16),
                child:   Divider(height: 2,color: Colors.black87,),
              )

            ],
          ),
        ),


      ],
    );
  }
}
