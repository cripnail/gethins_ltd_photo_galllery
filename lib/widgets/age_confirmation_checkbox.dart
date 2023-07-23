import 'package:flutter/material.dart';

class AgeConfirmationCheckbox extends StatelessWidget {
  final bool isConfirmed;
  final ValueChanged<bool?> onChanged;

  AgeConfirmationCheckbox({required this.isConfirmed, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: isConfirmed,
        onChanged: onChanged,
      ),
      title: const Text('I confirm I am over 19/21 years old'),
    );
  }
}
