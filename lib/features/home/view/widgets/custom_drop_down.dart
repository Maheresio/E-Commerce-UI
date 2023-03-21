import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: 16.w),
        child: DropdownButtonFormField2(
          alignment: AlignmentDirectional.centerStart,
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          isExpanded: true,
          hint: Text('Size', style: Theme.of(context).textTheme.bodyLarge),
          items: genderItems
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                    ),
                  ))
              .toList(),
          validator: (value) {
            if (value == null) {
              return 'Please select gender.';
            }
            return null;
          },
          onChanged: (value) {},
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
