import 'package:flutter/material.dart';

class GenderChoiceChip extends StatelessWidget {
  final String? gender;
  final String? selectedGender;
  final void Function(String?) onSelected;

  GenderChoiceChip({
    this.gender,
    this.selectedGender,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(gender!),
      selected: selectedGender == gender,
      onSelected: (isSelected) {
        if (isSelected) {
          onSelected(gender); // Call the callback with the selected gender
        }
      },
    );
  }
}
