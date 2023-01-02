import 'package:flutter/material.dart';

class SymptomsCategory extends StatelessWidget {
  final String icon;
  final String text;
  const SymptomsCategory({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade300.withOpacity(0.7),
          borderRadius: BorderRadius.circular(15)),
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            height: 32,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 19, color: Colors.black),
          )
        ],
      ),
    );
  }
}
