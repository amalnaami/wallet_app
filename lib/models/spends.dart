import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet_app/constant.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/services/spend_data_base_provider.dart';
import 'package:wallet_app/services/spends_db_model.dart';

class AddNewSpends extends StatefulWidget {
  @override
  _AddNewSpendsState createState() => _AddNewSpendsState();
}

class _AddNewSpendsState extends State<AddNewSpends> {
  String name;
  String data;
  String price;
  bool isImportant = false;

  String val = '';
  var _titleController = TextEditingController();
  var _dataController = TextEditingController();
  var _priceController = TextEditingController();
  bool isWrite = false;

  String typeUser0 = '0';
  String dropdwnValue0 = null;
  String typeUser1 = '0';
  String dropdwnValue1 = null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'إضافة مصروف',
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
                  keyboardType:TextInputType.text ,

                  controller: _titleController,
                  decoration: InputDecoration(
                      hintText: 'اسم المنتج',
                      hintStyle: dataStyle,
                      border: InputBorder.none),
                )),
            SizedBox(
              height: size.width / 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

               Expanded(
                 child: Container(
                   margin: EdgeInsets.all(6),
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
                   alignment: Alignment.center,
                   padding: EdgeInsets.only(right: 10),
                   child: Row(
                     children: [
                       Expanded(
                         child: DropdownButton<String>(
                           underline: Container(),
                           value: dropdwnValue1,
                           isExpanded: true,
                           hint: Container(
                             padding: EdgeInsets.only(left: 10),
                             child: Text(
                               'العملة',
                               style: dataStyle.copyWith(fontSize: 13),
                             ),
                           ),
                           icon: Icon(
                             Icons.keyboard_arrow_down,
                             color: Color(0xff3A3A3A),
                             size: 22,
                           ),
                           style: TextStyle(color: Colors.deepPurple),
                           onChanged: (String newValue) {
                             setState(() {
                               if (newValue == 'شيكل') {
                                 dropdwnValue1 = newValue;
                                 typeUser1 = '0';
                               } else if (newValue == 'دولار') {
                                 dropdwnValue1 = newValue;
                                 typeUser1 = '1';
                               }
                             });
                           },
                           items: <String>[
                             'دولار',
                             'شيكل'
                           ].map<DropdownMenuItem<String>>((String value) {
                             return DropdownMenuItem<String>(
                                 value: value,
                                 child: Container(
                                   margin: EdgeInsets.only(right: 2, left: 12),
                                   child: Text(
                                     value,
                                     style: dataStyle.copyWith(
                                         color: Colors.black,
                                         fontWeight: FontWeight.w400,
                                         fontSize: 14),
                                   ),
                                 ));
                           }).toList(),
                         ),
                       ),
                       Expanded(
                         child: TextField(
                           textAlign: TextAlign.right,
                           onChanged: (val) {
                             price = val;
                           },
                           keyboardType:TextInputType.number ,

                           controller: _priceController,
                           decoration: InputDecoration(
                               hintText: 'السعر',
                               hintStyle: dataStyle,
                               border: InputBorder.none),
                         ),
                       ),

                     ],
                   ),
                 ),
               ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(6),
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
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(right: 10),
                    child: DropdownButton<String>(
                      underline: Container(),
                      value: dropdwnValue0,
                      isExpanded: true,
                      hint: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'اسم التصنيف',
                          style: dataStyle,
                        ),
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xff3A3A3A),
                        size: 22,
                      ),
                      style: TextStyle(color: Colors.deepPurple),
                      onChanged: (String newValue) {
                        print('selectedValue  $newValue');

                        print('typeUser $typeUser0');
                        setState(() {
                          if (newValue == 'غير مصنف') {
                            dropdwnValue0 = newValue;
                            typeUser0 = '0';
                          } else if (newValue == 'مواد غذائية') {
                            dropdwnValue0 = newValue;
                            typeUser0 = '1';
                          } else if (newValue == 'مستلزمات البيت') {
                            dropdwnValue0 = newValue;
                            typeUser0 = '2';
                          } else if (newValue == 'مواصلات') {
                            dropdwnValue0 = newValue;
                            typeUser0 = '3';
                          } else if (newValue == 'فواتير') {
                            dropdwnValue0 = newValue;
                            typeUser0 = '4';
                          } else if (newValue == 'صحة') {
                            dropdwnValue0 = newValue;
                            typeUser0 = '5';
                          } else if (newValue == 'رياضة') {
                            dropdwnValue0 = newValue;
                            typeUser0 = '6';
                          } else if (newValue == 'صدقات') {
                            dropdwnValue0 = newValue;
                            typeUser0 = '7';
                          } else if (newValue == 'اكل في الخارج') {
                            dropdwnValue0 = newValue;
                            typeUser0 = '8';
                          } else if (newValue == 'نزهات') {
                            dropdwnValue0 = newValue;
                            typeUser0 = '9';
                          } else if (newValue == 'ملابس') {
                            dropdwnValue0 = newValue;
                            typeUser0 = '10';
                          } else if (newValue == 'هدايا') {
                            dropdwnValue0 = newValue;
                            typeUser0 = '11';
                          } else if (newValue == 'مصروف اولاد') {
                            dropdwnValue0 = newValue;
                            typeUser0 = '12';
                          } else if (newValue == 'مواد تجميل') {
                            dropdwnValue0 = newValue;
                            typeUser0 = '13';
                          } else if (newValue == 'لوازم شخصية') {
                            dropdwnValue0 = newValue;
                            typeUser0 = '14';
                          } else if (newValue == 'كتب') {
                            dropdwnValue0 = newValue;
                            typeUser0 = '15';
                          } else if (newValue == 'السيارة') {
                            dropdwnValue0 = newValue;
                            typeUser0 = '16';
                          }
                        });
                      },
                      items: <String>[
                        'السيارة',
                        'كتب',
                        'لوازم شخصية',
                        'مواد تجميل',
                        'مصروف اولاد',
                        'هدايا',
                        'ملابس',
                        'نزهات',
                        'اكل في الخارج',
                        'صدقات',
                        'رياضة',
                        'صحة',
                        'فواتير',
                        'مواصلات',
                        'مستلزمات البيت',
                        'مواد غذائية',
                        'غير مصنف'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Container(
                              margin: EdgeInsets.only(right: 2, left: 12),
                              child: Text(
                                value,
                                style: dataStyle.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ));
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.width / 4,
            ),
            InkWell(
              onTap: () async {
                SpendsModelDb spendsModelDb =
                SpendsModelDb(name: name, data: dropdwnValue0, price: price,currency: dropdwnValue1);
                await context
                    .read<SpendDataBaseProvider>()
                    .insertNewSpend(spendsModelDb);
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
