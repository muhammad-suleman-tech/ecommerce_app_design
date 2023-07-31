import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  MyContainer({this.text = "", super.key});

  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffD9E4E8), width: 1),
          borderRadius: BorderRadius.circular(8)),
      height: 40,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
              color: Color(0xff89999F),fontSize: 13, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
