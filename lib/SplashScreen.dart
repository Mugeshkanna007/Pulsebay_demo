import 'package:demo/HomePage.dart';
import 'package:demo/LoginScreen.dart';
import 'package:demo/RoutePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token;

  @override
  void initState() {
    super.initState();
    _nextPage();
  }

  Future logOrHome() async {
    final SharedPreferences keepLogin = await SharedPreferences.getInstance();
    var keepLoginU = keepLogin.getString('token');
    setState(() {
      token = keepLoginU;
    });

    debugPrint(
      keepLogin.getString('token'),
    );
  }

  _nextPage() {
    logOrHome().whenComplete(() async {
      await Future.delayed(const Duration(seconds: 4), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            // ignore: unnecessary_null_comparison
            builder: (context) => token == null
                ? const RoutePage()
                : const HomePage(), /*BottomMenu()*/
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/pulsebaylogo.png",
          height: 100.h,
        ),
      ),
    );
  }
}
