import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;
  final double corderRadius;
  const AppButton({
    super.key,
    required this.onPressed,
    required this.name,
    this.corderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(corderRadius),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
