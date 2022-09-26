import 'dart:ui';

import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';

import '../color/colors.dart';

class BoxTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obsecure;
  final bool readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final TextAlign textAlign;
  final bool autofocus;
  final bool enabled;
  final String? errorText;
  final String? label;
  final String? hintText;
  final Color? hintColor;
  final Color? fillColor;
  final IconData? icon;
  final Function(String)? onSaved;
  final IconData? prefix;
  final TextDirection? textDirection;
  final List<TextInputFormatter> ?inputFormatters;
  const BoxTextField({
    Key? key,
    this.controller,
    this.validator,
    this.obsecure = false,
    this.readOnly = false,
    this.onTap,
    this.onEditingCompleted,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.autofocus = false,
    this.enabled = true,
    this.errorText,
    this.hintColor,
    this.fillColor,
    this.onSaved,
    required this.label,
    this.prefix,
    this.icon,
    this.hintText,
    this.textAlign = TextAlign.start,
    this.textDirection = TextDirection.rtl,  this.inputFormatters,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          inputFormatters: [],
            cursorColor: Theme.of(context).primaryColor,
            style: TextStyle(color: kblack,fontSize: 18, fontWeight: FontWeight.w300),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textAlign: textAlign,
            textDirection: textDirection,
            onChanged: onChanged,
            onEditingComplete: onEditingCompleted,
            autofocus: autofocus,
            onTap: onTap,
            enabled: enabled,
            readOnly: readOnly,
            obscureText: obsecure,
            keyboardType: keyboardType,
            controller: controller,
            decoration: InputDecoration(
              hintText: label,
              // hintText: hintText,

              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).primaryColor, width: 2),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).primaryColor, width: 2),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(12.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(12.0),
              ),
              filled: true,
              fillColor: kwhite,

              errorText: errorText,
              hintStyle: TextStyle(
                  color: kblack, fontSize: 13, fontWeight: FontWeight.w300),
            ),
            validator: validator),
        SizedBox(
          height: heightApp * 0.02,
        )
      ],
    );
  }
}
