
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/constant.dart';
import 'package:wallet_app/models/item_onboarding.dart';
import 'package:wallet_app/ui_screen/main_home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<IntroScreen> intros = [];
  PageController controller = PageController();
  var currentPageValue = 0.0;

  @override
  Widget build(BuildContext context) {
    intros = [
      IntroScreen(
        image: 'assets/image/img.png',
        title: 'تطبيق مصروفي سهل وبسيط لحل مشكلة الانفاق العشوائي',
      ),
      IntroScreen(
        image: 'assets/image/img2.png',
        title: 'نوفر لك اضافة قوائم المصاريف التي اشريتها والتي ترغب بشراءها مستقبلا',
      ),
      IntroScreen(
        image: 'assets/image/img1.png',
        title: 'مع مصروف يمكنك التحكم في مصاريفك بسهولة',
      )
    ];
Size size= MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.all(12),
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: PageView.builder(
                controller: controller,
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        intros[index].image.toString(),
                        width:size.width/1.5,
                      ),
                      Container(
                        child: Text(
                          intros[index].title,
                          textAlign: TextAlign.center,
                          style: dataStyle.copyWith(color: deepPurple),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              (index != 2)
                                  ? controller.jumpToPage((index + 1))
                                  :

                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MainHomeScreen()),
                                    );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color:amberColor,
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 8),
                              width: size.width/2,
                              child: (index == 2)
                                  ? Text(
                                'انهاء',
                                style: dataStyle.copyWith(
                                    fontSize: 24, color: Colors.white),
                              )
                                  : Text(
                                'التالي',
                                style: dataStyle.copyWith(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),

                          (index != 2)
                              ? InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MainHomeScreen()),
                                );
                              },
                              child: Text(
                                'تخطِ',
                                style: dataStyle.copyWith(color: deepPurple),
                              ))
                              : Container()
                        ],
                      )
                    ],
                  );
                },
                itemCount: intros.length,
                onPageChanged: (index) {
                  print('object $index');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
