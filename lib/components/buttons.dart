import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final double width, height;
  final String? ico;
  final Color? colors;
  final VoidCallback onClick;

  Buttons({
    super.key,
    required this.width,
    required this.height,
    required this.ico,
    required this.colors,
    required this.onClick,
  });

  bool isOperator(String s) {
    return s == '+' || s == '-' || s == '%' || s == 'x' || s == '÷' || s == 'C' || s == '( )';
  }

  @override
  Widget build(BuildContext context) {
    // Calculate text size based on button size
    double fontSize = width / 3;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          width: width - 10,
          height: height - 10,
          decoration: BoxDecoration(
            color: ico == '=' ? Colors.green : colors,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                ico.toString(),
                style: TextStyle(
                  fontSize: fontSize, // Adjusted font size
                  fontWeight: FontWeight.bold,
                  color: isOperator(ico!) ? Colors.green : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
