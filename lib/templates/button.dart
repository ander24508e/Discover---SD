import 'package:flutter/material.dart';
import 'package:app_turism/templates/color.dart';

class MyButton1 extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButton1({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: barColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 10.0),
            Text(
              textAlign: TextAlign.center,
              text,
              style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10.0),
            Icon(Icons.arrow_forward, color: Color(0xFF000000)),
          ],
        ),
      ),
    );
  }
}

class MyButton2 extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButton2({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: secundaryColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              text,
              style: const TextStyle(
                color: Color(0xFF000000),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10.0),
            const Icon(Icons.arrow_forward, color: Color(0xFF000000)),
          ],
        ),
      ),
    );
  }
}