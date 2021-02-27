import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/services/data_base_provider.dart';
import 'package:wallet_app/services/money_gived_provider.dart';
import 'package:wallet_app/services/spend_data_base_provider.dart';
import 'package:wallet_app/ui_screen/onboarding.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((value) {
      Provider.of<DataBaseProvider>(context, listen: false).getAllNeeds();
      Provider.of<SpendDataBaseProvider>(context, listen: false).getAllSpend();
      Provider.of<MoneyProvider>(context, listen: false).getAllMoney();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return OnBoardingScreen();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/image/logo.png'),
      ),
    );
  }
}
