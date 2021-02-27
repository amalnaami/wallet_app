import 'package:flutter/material.dart';
import 'package:wallet_app/constant.dart';

class GridItems extends StatefulWidget {
  String title;
  IconData icon;
  Function action;
bool isTap;
  GridItems({this.title, this.icon, this.action,this.isTap});

  @override
  _GridItemsState createState() => _GridItemsState();
}

class _GridItemsState extends State<GridItems> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.action,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0,2),
              blurRadius: 6,
              spreadRadius: 2
            )
          ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(12), ),
        child: InkWell(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 50,
                color: deepPurple,
              ),
              Text(
                widget.title,
                style: dataStyle.copyWith(fontSize: 20, color: deepPurple),
              )
            ],
          ),
        ),
      ),
    );
  }
}
