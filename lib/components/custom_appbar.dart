import 'package:flutter/material.dart';
import 'package:kooha_test/export.dart';

class CustomAppBar extends StatelessWidget {
  final Widget middleOrEndWidget;
  final VoidCallback? onBackButtonPressed;
  final bool? isWidget;

  const CustomAppBar({
    Key? key,
    required this.middleOrEndWidget,
    this.onBackButtonPressed,
    this.isWidget = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    Widget appBarWidget;

    if (middleOrEndWidget is Text) {
      // If middleOrEndWidget is a Text widget, center it.
      appBarWidget = Center(child: middleOrEndWidget);
    } else {
      // Otherwise, place it on the right end.
      appBarWidget = middleOrEndWidget;
    }

    return Row(
      mainAxisAlignment: isWidget == true
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 40.0, // Adjust the size as needed
          height: 40.0, // Adjust the size as needed
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: theme.grey, // Customize the border color
              width: 1.0, // Customize the border width
            ),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: onBackButtonPressed,
            color: Colors.black, // Customize the arrow color
            iconSize: 24.0, // Adjust the size as needed
          ),
        ),
        appBarWidget,
      ],
    );
  }
}
