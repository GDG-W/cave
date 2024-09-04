import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import '../themes/colors.dart';
import '../themes/text_field_theme.dart';
import '../themes/theme_data.dart';

class DevfestTextFormField extends StatelessWidget {
  const DevfestTextFormField({
    super.key,
    this.title,
    this.controller,
    this.hint,
    this.info,
    TextInputType? keyboardType,
    Color? iconColor,
    this.onChanged,
    this.validator,
    this.textInputAction,
    this.autovalidateMode,
  })  : keyboardType = keyboardType ?? TextInputType.text,
        iconColor = iconColor ?? DevfestColors.grey10;
  final String? title;
  final String? info;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Color iconColor;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    final textFieldTheme = DevFestTheme.of(context).textFieldTheme ??
        DevfestTextFieldTheme.light();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: DevFestTheme.of(context).textTheme?.bodyBody3Medium,
          ),
          Constants.smallVerticalGutter.verticalSpace,
        ],
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          validator: validator,
          textInputAction: textInputAction,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          keyboardAppearance: Brightness.dark,
          style: textFieldTheme.style,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: textFieldTheme.hintStyle,
            errorStyle: textFieldTheme.errorStyle,
            errorMaxLines: 2,
            contentPadding: const EdgeInsets.all(16),
            border: textFieldTheme.border,
            enabledBorder: textFieldTheme.enabledBorder,
            focusedBorder: textFieldTheme.focusedBorder,
            errorBorder: textFieldTheme.errorBorder,
            focusedErrorBorder: textFieldTheme.errorBorder,
          ),
        ),
        Constants.largeVerticalGutter.verticalSpace,
      ],
    );
  }
}
