import 'package:flutter/material.dart';
import 'package:wallet_app/constant.dart';
import 'package:wallet_app/services/data_base_provider.dart';
import 'package:wallet_app/services/needs_db_model.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/services/spend_data_base_provider.dart';
import 'package:wallet_app/services/spends_db_model.dart';

class SpendModel extends StatelessWidget {
  SpendsModelDb spendsModelDb;

  SpendModel(this.spendsModelDb);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Column(
          children: [
            Card(
              margin: EdgeInsets.only(left: 20, bottom: 0),
              elevation: 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          spendsModelDb.name,
                          style: dataStyle.copyWith(color: deepPurple),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'الاسم',
                          style: dataStyle.copyWith(
                              color: Colors.black, fontSize: 20),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          spendsModelDb.data,
                          style: dataStyle.copyWith(color: purpleColor),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'التصنيف',
                          style: dataStyle.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          spendsModelDb.currency,
                          style: dataStyle.copyWith(color: amberColor),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          spendsModelDb.price,
                          style: dataStyle.copyWith(color: amberColor),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'السعر',
                          style: dataStyle.copyWith(color: Colors.black),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
        InkWell(
          onTap: () async {
            await context.read<SpendDataBaseProvider>().deleteSpend(spendsModelDb);
          },
          child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              )),
        )
      ],
    );
  }
}
