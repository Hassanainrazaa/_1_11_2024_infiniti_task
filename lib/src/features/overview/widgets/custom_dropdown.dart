import 'package:_1_11_2024_infiniti/src/constants/dimension.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items; // List of dropdown items
  final double width;
  final double height;

  const CustomDropdown({
    super.key,
    required this.items,
    this.width = 279.0,
    this.height = 48.0,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue; // Stores the selected value

  @override
  void initState() {
    super.initState();
    selectedValue = widget.items.isNotEmpty ? widget.items.first : null;
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Container(
      width: MySize.size279,
      
      height: widget.height,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          14,
        ),
        border: Border.all(
          color: const Color.fromARGB(255, 230, 229, 229),
          width: 1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
          items: widget.items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      ),
    );
  }
}
