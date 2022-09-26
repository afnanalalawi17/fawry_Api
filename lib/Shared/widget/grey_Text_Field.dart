import 'dart:ui';

import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:flutter/material.dart';

import '../color/colors.dart';



class GreyTextField extends StatelessWidget {
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
  final Color? hintColor;
  final Color? fillColor;
 final IconData? icon;
  final Function(String)? onSaved;
  final IconData? prefix;

  const GreyTextField({
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
  this.textAlign = TextAlign.start,
    this.hintColor,
    this.fillColor ,
    this.onSaved, required this.label, this.prefix, this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        TextFormField(  cursorColor: Theme.of(context).primaryColor,       style: TextStyle(color: kblack),

           autovalidateMode:
                                AutovalidateMode.onUserInteraction,
         textAlign: textAlign,
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
              labelText: label,
              enabledBorder: OutlineInputBorder(
                borderSide:  BorderSide(color: kgreyLight,width: 2),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:  BorderSide(color:kgreyLight,width: 2),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(12.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(12.0),
              ),
              filled: true,
              fillColor: kwhite,
             
              
              errorText: errorText,
               hintStyle: TextStyle(color: kblack,fontSize: 13,fontWeight: FontWeight.w300),
               labelStyle:  TextStyle(color: kblack,fontSize: 13,fontWeight: FontWeight.bold),
              // contentPadding: EdgeInsets.all(20),
            //   suffixIcon: Icon(
            //   icon,
            //   color: kblack,
            // ),
            ),
            validator: validator),
          SizedBox(height: heightApp*0.02,)
      ],
    );
  }
}
