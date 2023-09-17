import 'package:flutter/material.dart';
import 'package:kooha_test/export.dart';

class PrimaryButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final String buttonText;
  final Color? buttonTextColor;
  final VoidCallback onPressed;
  final bool isLoading; // Add isLoading property

  const PrimaryButton({
    super.key,
    this.height,
    this.width,
    this.color,
    this.buttonTextColor,
    required this.buttonText,
    required this.onPressed,
    this.isLoading = false, // Default value is false
  });

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed, // Disable button when loading
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? theme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        minimumSize: Size(width ?? double.infinity, height ?? 62.0),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Visibility(
            visible: !isLoading, // Show text only when not loading
            child: PrimaryText(
              text: buttonText,
              color: buttonTextColor ?? theme.primaryText,
              fontSize: 16,
            ),
          ),
          Visibility(
            visible: isLoading, // Show spinner when loading
            child: CircularProgressIndicator(
              color: theme.primaryText,
              strokeWidth: 0.5,
            ), // Customize with your loading spinner
          ),
        ],
      ),
    );
  }
}
