import 'package:flutter/material.dart';


class Button extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const Button({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 250,
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: Color.fromRGBO(74, 103, 222, 1),
            width: 2,
          )
          ),
        child: Center(
          child: Text(text, style: TextStyle(
            fontFamily: 'pin-sans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(74, 103, 222, 1),
          ),
          ),
        ),
      ),
    );
  }
}