import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Function() buttonTapped;

  const CustomAppButton({
    required this.text,
    required this.color,
    required this.textColor,
    required this.buttonTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buttonTapped(); // Call the provided buttonTapped function
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade300, // Light gray border
            width: 2.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Subtle shadow
              blurRadius: 6, // Amount of blur
              offset: const Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
