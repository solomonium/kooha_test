import 'package:flutter/material.dart';
import 'package:kooha_test/export.dart';

class CustomTextField extends StatefulWidget {
  final Icon? icon;
  final TextInputType textInputType;
  final String? labelText;
  final TextEditingController textController;
  final bool autoFocus;
  final String? Function(String?)? validate;
  final bool isPassword;
  final String? hintText;
  final TextInputAction textInputAction;
  final bool? obscure;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FormFieldSetter<String>? onChanged;

  const CustomTextField({
    Key? key,
    this.icon,
    this.obscure,
    this.isPassword = false,
    required this.textInputType,
    this.labelText,
    required this.textController,
    required this.autoFocus,
    this.validate,
    this.onChanged, // Add the onChanged callback to the constructor
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    required this.textInputAction,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SecondaryText(
            text: widget.labelText ?? '',
            fontSize: 14,
            color: theme.primaryText,
          ),
          5.verticalSpace,
          SizedBox(
            height: 80,
            child: TextFormField(
              cursorColor: theme.primary,
              onChanged: widget.onChanged,
              controller: widget.textController,
              validator: widget.validate,
              textInputAction: widget.textInputAction,
              keyboardType: widget.textInputType,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: widget.isPassword,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(color: theme.grey),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: theme.secondary, width: 0.9),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: theme.grey, width: 0.9),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: theme.redButton, width: 0.9),
                ),
                filled: true,
                fillColor: theme.greyTextFieldFill,
                errorStyle: const TextStyle(),
                prefixIcon: widget.prefixIcon,
                suffixIcon:
                    widget.isPassword ? widget.suffixIcon : const SizedBox(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
