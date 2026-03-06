import 'package:flutter/material.dart';
import 'package:flutter_kin_cake_kun_app/models/cake_shop.dart';

class CakeShopDetailUi extends StatefulWidget {
  // สร้างตัวแปรรับค่าที่ส่งมา
  CakeShop? cakeShop;

  // ตัวแปรที่สร้างมารับค่าที่ส่งมา
  CakeShopDetailUi({super.key, this.cakeShop});

  @override
  State<CakeShopDetailUi> createState() => _CakeShopDetailUiState();
}

class _CakeShopDetailUiState extends State<CakeShopDetailUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          widget.cakeShop!.name!,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
