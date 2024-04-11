import "package:flutter/material.dart";

class DVMessage extends StatelessWidget {
  final String message;
  final Color color;

  const DVMessage({
    super.key,
    required this.message,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.0,
          color: color,
        ),
      ),
    );
  }
}
