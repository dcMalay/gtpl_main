import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gtpl/provider/login.dart';
import 'package:provider/provider.dart';

class DropdownLogin extends StatefulWidget {
  const DropdownLogin({Key? key}) : super(key: key);

  @override
  State<DropdownLogin> createState() => _DropdownLoginState();
}

class _DropdownLoginState extends State<DropdownLogin> {
  final List<String> items = [
    'Cable',
    'Broadband',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Row(
            children: [
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  'Select Item',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value:
              Provider.of<LoginProvider>(context, listen: true).selectedValue,
          onChanged: (value) {
            setState(() {
              Provider.of<LoginProvider>(context, listen: false)
                  .onChanged(value as String);
            });
          },
          icon: const Icon(
            Icons.keyboard_arrow_down,
          ),
          iconSize: 14,
          iconEnabledColor: Theme.of(context).primaryColor,
          iconDisabledColor: Colors.white,
          buttonHeight: 50,
          buttonWidth: 160,
          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.transparent,
            ),
            color: Colors.white,
          ),
          buttonElevation: 0,
          itemHeight: 20,
          itemPadding: const EdgeInsets.only(
            left: 14,
            right: 14,
            top: 2,
            bottom: 2,
          ),
          dropdownMaxHeight: 200,
          dropdownWidth: 200,
          dropdownPadding: const EdgeInsets.symmetric(vertical: 10),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          dropdownElevation: 5,
          scrollbarRadius: const Radius.circular(20),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          offset: const Offset(-20, 0),
        ),
      ),
    );
  }
}
