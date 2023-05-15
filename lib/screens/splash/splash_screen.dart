import 'package:flutter/material.dart';
import 'package:net_market/app_setUp.dart';

import '../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    goToNextView();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Spacer(),
            Image.asset(
              'assets/Logo-static@3x.png',
              fit: BoxFit.cover,
              height: 200,
            ),
            Spacer(),
            Center(
              child: CircularProgressIndicator(),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  void goToNextView() {
    Future.delayed(Duration(milliseconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => AppSetUp()));
    });
  }
}
