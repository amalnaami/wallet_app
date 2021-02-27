import 'package:flutter/material.dart';
import 'package:wallet_app/constant.dart';
import 'package:wallet_app/models/grid_items.dart';
import 'package:wallet_app/ui_screen/all_money.dart';
import 'package:wallet_app/ui_screen/money_give_to_other.dart';
import 'package:wallet_app/ui_screen/needs_screen.dart';
import 'package:wallet_app/ui_screen/spend_screen.dart';

class MainHomeScreen extends StatefulWidget {
  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'مصروف',
          style: dataStyle.copyWith(color: Colors.white),
        ),
        backgroundColor: deepPurple,
      ),
      backgroundColor: purpleColor,
      body:
          GridView.count(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: [
              GridItems(
                action: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NeedsScreen()),
                  );
                },
                title: 'أحتاج شراءه',
                icon: Icons.shopping_cart_outlined,
              ),
              GridItems(
                action: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SpendScreen()),
                  );
                },
                title: 'قوائم المصاريف',
                icon: Icons.monetization_on_outlined,
              ),
              GridItems(
                action: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MoneyGiveToOther()),
                  );
                },
                title: 'ديوني',
                icon: Icons.money_off_rounded,
              ),
              GridItems(
                action: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllMoney()),
                  );
                },
                title: 'ميزانيتي',
                icon: Icons.card_giftcard,
              ),
            ],
          ),
          // Container(
          //   margin: EdgeInsets.symmetric(vertical: 30),
          //   width: size.width / 3.5,
          //   decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: Colors.white,
          //       boxShadow: [
          //         BoxShadow(
          //             color: deepPurple.withOpacity(.2),
          //             blurRadius: 10,
          //             offset: Offset(0, 4),
          //             spreadRadius: 2)
          //       ]),
          //   child: Image.asset('assets/image/logo.png'),
          // ),

    );
  }
}
