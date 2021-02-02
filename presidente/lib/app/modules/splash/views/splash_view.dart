import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presidente/app/data/model/vereador_model.dart';
import 'package:presidente/app/routes/app_pages.dart';

VereadorModel vereadorModel = VereadorModel(name: 'Marcelo Fernandes', isPresident: false);

class SplashView extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () => Get.offAndToNamed(Routes.HOME, arguments: {'vereadorModel': vereadorModel}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 200, bottom: 10),
          child: Container(
            height: 200,
            width: 200,
/*decoration: BoxDecoration(
image: DecorationImage(
image: AssetImage('images/img_splash.png'),
fit: BoxFit.fill)),*/
          ),
        ),
        Text(
          'CONNECT',
          style: TextStyle(
              color: Colors.greenAccent,
              fontSize: 20,
              decoration: TextDecoration.none),
        ),
      ]),
    );
  }
}
