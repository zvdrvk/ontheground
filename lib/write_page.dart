import 'package:flutter/material.dart';
import 'package:ontheground/main.dart';
import 'package:ontheground/main_page.dart';

class OtgWritePage extends StatelessWidget {
  const OtgWritePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        title: Text(
          '크루 모집하기',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [],
      )),
    );
  }
}
