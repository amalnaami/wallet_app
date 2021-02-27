import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/services/data_base_provider.dart';
import 'package:wallet_app/services/db_helper.dart';
import 'package:wallet_app/services/money_gived_provider.dart';
import 'package:wallet_app/services/spend_data_base_provider.dart';
import 'package:wallet_app/ui_screen/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.taskDBHelper.initNeedsDataBase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataBaseProvider>(
          create: (context) {
            return DataBaseProvider();
          },
        ),  ChangeNotifierProvider<SpendDataBaseProvider>(
          create: (context) {
            return SpendDataBaseProvider();
          },
        ),  ChangeNotifierProvider<MoneyProvider>(
          create: (context) {
            return MoneyProvider();
          },
        ),

      ],
      child: MaterialApp(
        title: 'Masrouf App',
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

