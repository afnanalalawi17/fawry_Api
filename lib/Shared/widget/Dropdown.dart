
import 'package:fawry_app/Shared/color/colors.dart';
import 'package:fawry_app/Shared/widget/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dropdown extends StatelessWidget {
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final Color? dropdownColor;
  final  FormFieldValidator? validator;
  final List<DropdownMenuItem<Object>>? items;
  final Color? fillColor;
  final Function(Object?)? onChanged;
  final String ?hintText;

  const Dropdown({
    Key? key,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.dropdownColor,
    required this.validator,
   required this.items,
    this.fillColor,required this.hintText, this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField(
          
          iconEnabledColor: Theme.of(context).primaryColor,
  
          style: TextStyle(color: kblack),
          dropdownColor: kwhite,
          validator: validator,
          isDense: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            fillColor: kwhite,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
                color: kblack, fontSize: 13, fontWeight: FontWeight.w300),
            border: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0,
              ),
            ),
          ),
          items: items,
          onChanged: onChanged,
          isExpanded: true,
        ),
        SizedBox(
          height: heightApp * 0.02,
        )
      ],
    );
  }
}
