import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/constant.dart';
import 'package:wallet_app/services/spend_data_base_provider.dart';

class AllMoney extends StatefulWidget {
  @override
  _AllMoneyState createState() => _AllMoneyState();
}

class _AllMoneyState extends State<AllMoney> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[100],
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              size: 28,
              color: deepPurple,
            ),
          )),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child:
              Consumer<SpendDataBaseProvider>(builder: (context, value, child) {
            return Column(
              children: [
                SizedBox(
                  height: size.width / 5,
                ),
                Image.asset(
                  'assets/image/logo.png',
                  width: size.width / 3,
                ),
                SizedBox(
                  height: size.width / 5,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          hintText: '00000',
                          border: InputBorder.none,
                          hintStyle: dataStyle.copyWith(color: amberColor)),
                    )),
                    Container(
                      margin: EdgeInsets.all(14),
                      child: Text(
                        'ميزانيتي',
                        style: dataStyle,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          hintText: '00000',
                          border: InputBorder.none,
                          hintStyle: dataStyle.copyWith(color: amberColor)),
                    )),
                    Container(
                      margin: EdgeInsets.all(14),
                      child: Text('صرف حتى الآن', style: dataStyle),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          hintText: '00000',
                          border: InputBorder.none,
                          hintStyle: dataStyle.copyWith(color: amberColor)),
                    )),
                    Container(
                      margin: EdgeInsets.all(14),
                      child: Text('تبقى لي', style: dataStyle),
                    ),
                  ],
                ),
              ],
            );
          })),
    );
  }
}
