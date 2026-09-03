import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/theme/app_colours.dart';
import 'package:pick_finish_predictor_ui/views/layouts/app_style.dart';

class AppInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? errorText;
  final bool isCalculated;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;

  const AppInputField({
    super.key,
    required this.label,
    required this.controller,
    this.errorText,
    this.isCalculated = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final style = AppStyle.of(context);
    final bool hasError = errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildInputContainer(context: context, hasError: hasError, style: style),
        if (hasError) _buildErrorMessage(style: style),
      ],
    );
  }

  Color _resolveBackgroundColour(bool hasError) {
    if (hasError) {
      return AppColours.textFieldBackgroundErrorState;
    } else if (isCalculated) {
      return AppColours.textFieldBackgroundValidState;
    }
    return AppColours.textFieldBackgroundEnabled;
  }

  Widget _buildInputContainer({
    required BuildContext context,
    required bool hasError,
    required AppStyle style,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: _resolveBackgroundColour(hasError),
        borderRadius: BorderRadius.circular(0),
      ),
      child: ValueListenableBuilder<TextEditingValue>(
        valueListenable: controller,
        builder: (context, value, child) {
          final bool hasText = value.text.isNotEmpty;

          return TextField(
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged,
            style: TextStyle(
              color: AppColours.textFieldForegroundNormal,
              fontSize: style.textFieldFont,
              fontFamily: 'Verdana',
            ),
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(
                color: AppColours.textFieldForegroundHint,
                fontSize: style.textFieldFont,
                fontFamily: 'Verdana',
              ),
              floatingLabelStyle: TextStyle(
                color: AppColours.textFieldForegroundHint,
                fontSize: style.textFieldFont,
                fontFamily: 'Verdana',
              ),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: style.textFieldVerticalPadding,
                vertical: style.textFieldVerticalPadding,
              ),
              border: InputBorder.none,
              suffixIcon: hasText ? _buildSuffixIcon(style: style) : null,
            ),
          );
        },
      ),
    );
  }

  Widget _buildSuffixIcon({required AppStyle style}) {
    return IconButton(
      padding: const EdgeInsets.only(right: 12.0),
      constraints: BoxConstraints(
        minWidth: style.textFieldSuffixWidth,
        minHeight: style.textFieldSuffixHeight,
      ),
      icon: Icon(
        Icons.close,
        size: style.textFieldCloseIcon,
        color: AppColours.textFieldForegroundNormal,
      ),
      onPressed: () {
        controller.clear();
        if (onClear != null) onClear!();
        if (onChanged != null) onChanged!('');
      },
    );
  }

  Widget _buildErrorMessage({required AppStyle style}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 4),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            errorText!,
            style: TextStyle(
              color: AppColours.textFieldForegroundInvalid,
              fontSize: style.textFieldErrorMessage,
              fontFamily: 'Verdana',
            ),
          ),
        ),
      ],
    );
  }
}