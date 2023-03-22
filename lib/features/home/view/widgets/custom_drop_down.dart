import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {super.key, required this.itemsList, required this.hintText});

  final List<String> itemsList;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: 16.w),
        child: DropdownButtonFormField2(
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          isExpanded: true,
          hint:
              Text(hintText, style: Theme.of(context).textTheme.bodyLarge),
          items: itemsList
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                    ),
                  ))
              .toList(),
          validator: (value) {
            if (value == null) {
              return 'Please select $hintText.';
            }
            return null;
          },
          onChanged: null,
          buttonStyleData: const ButtonStyleData(
            height: 50,
            padding: EdgeInsets.only(right: 10),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
            ),
            iconSize: 25,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
