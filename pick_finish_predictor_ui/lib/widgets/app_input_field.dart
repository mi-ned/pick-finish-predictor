import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/theme/app_colours.dart';

class AppInputField extends StatefulWidget {

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
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  @override
  void initState(){
    super.initState();
    widget.controller.addListener(_onTextChange);
  }
  
  @override
  void dispose() {
    widget.controller.removeListener(_onTextChange);
    super.dispose();
  }

  void _onTextChange(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final bool hasError = widget.errorText != null && widget.errorText!.isNotEmpty;
    final bool hasText = widget.controller.text.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildInputContainer(hasError: hasError, hasText: hasText),
        if(hasError) _buildErrorMessage(),
      ],
    );
  }

  Color _resolveBackgroundColour(bool hasError){
    if(hasError){
      return AppColours.textFieldBackgroundErrorState;
    } else if(widget.isCalculated){
      return AppColours.textFieldBackgroundValidState;
    }
    return AppColours.textFieldBackgroundEnabled;
  }

  Widget _buildInputContainer({required bool hasError, required bool hasText}) {
    return Container(
      decoration: BoxDecoration(
        color: _resolveBackgroundColour(hasError),
        borderRadius: BorderRadius.circular(0),
      ),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        style: const TextStyle(
          color: AppColours.textFieldForegroundNormal,
          fontSize: 13,
          fontFamily: 'Verdana',
        ),
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: const TextStyle(
            color: AppColours.textFieldForegroundHint,
            fontSize: 13,
            fontFamily: 'Verdana',
          ),
          floatingLabelStyle: const TextStyle(
            color: AppColours.textFieldForegroundHint,
            fontSize: 13,
            fontFamily: 'Verdana',
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          border: InputBorder.none,
          suffixIcon: _buildSuffixIcon(hasText),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 30,
          ),
        ),
      ),
    );
  }

  Widget? _buildSuffixIcon(bool hasText){
    if(!hasText) return null;
    return GestureDetector(
      onTap: () {                    
        widget.controller.clear();
        if (widget.onClear != null) widget.onClear!();
        if(widget.onChanged != null) widget.onChanged!('');
      },
      child: const Padding(padding: EdgeInsets.only(right: 12.0),
        child: Icon(
          Icons.close,
          size: 16,
          color: AppColours.textFieldForegroundNormal,
        ),
      ),
    );
  }

  Widget _buildErrorMessage(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 4),
        Align(
          alignment: Alignment.centerRight,              
          child: Text(
            widget.errorText!,
            style: const TextStyle(
              color: AppColours.textFieldForegroundInvalid,
              fontSize: 11,
              fontFamily: 'Verdana',
            ),
          ),
        ),
      ],
    );
  }
}