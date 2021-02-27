import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/constant.dart';
import 'package:wallet_app/models/add_new_needs.dart';
import 'package:wallet_app/services/data_base_provider.dart';
import 'package:wallet_app/ui_screen/needs_model.dart';

class NeedsScreen extends StatefulWidget {
  @override
  _NeedsScreenState createState() => _NeedsScreenState();
}

class _NeedsScreenState extends State<NeedsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              size: 28,
              color: Colors.white,
            )),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'أحتاج شراءه',
          style: dataStyle.copyWith(color: Colors.white),
        ),
        backgroundColor: deepPurple,
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
        margin: EdgeInsets.all(10),
        child: Consumer<DataBaseProvider>(builder: (context, value, child) {
          return (value.needModelDb.length == 0)
              ? Center(child: Image.asset('assets/image/no_need.png'))
              : ListView.builder(
                  padding: EdgeInsets.only(bottom: 50, top: 14),
                  itemCount: 1,
                  itemBuilder: (context, index) => new Column(
                    children: value.needModelDb
                        .map((
                          e,
                        ) =>
                            NeedsModel(e))
                        .toList(),
                  ),
                );
        }),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NewNeedsScreen()));
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
