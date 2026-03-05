import 'package:flutter/material.dart';
import 'package:flutter_kiln_cake_kun_app/views/cake_shop_list_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  // ทำ splashScreen หน่วงเวลา 3 วิ
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CakeShopListUi(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_welcome.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100.0),
              Text(
                'กินเค้กกันเถอะ',
                style: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Kin Cake Kun Theu',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 20.0),
              CircularProgressIndicator(
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
