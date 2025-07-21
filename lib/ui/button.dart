import 'package:flutter/material.dart';

class CastorButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? color;

  const CastorButton({
    super.key,
    required this.label,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).primaryColor,
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
} 