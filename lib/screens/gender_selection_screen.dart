import 'package:flutter/material.dart';
import 'package:photo_galllery/screens/rules_screen.dart';

import '../widgets/gender_choice_chip.dart';

class GenderSelectionScreen extends StatefulWidget {
  @override
  _GenderSelectionScreenState createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String? genderSelection; // Variable to store the selected gender

  // Function to show the information popup
  void _showInformationPopup() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Information'),
        content: const Text(
          'Отвечая на  этот вопрос Вы помогаете ИИ справиться со своей работой лучше. Если оставить вопрос без ответа, пол будет выбран случайно',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
  void _navigateToRulesScreen() {
    final trimmedGenderSelection = (genderSelection ?? '').trim();
    final selectedGender = trimmedGenderSelection.isNotEmpty ? trimmedGenderSelection : '0';
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RulesScreen(selectedGender: selectedGender),
      ),
    );
  }
  void _onGenderSelected(String? selectedGender) {
    setState(() {
      genderSelection = selectedGender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gender Selection'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 4),
          const SizedBox(
            width: 248,
            child: Text(
              'Пожалуйста, укажите пол человека на фото:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0, // Set the text to bold
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 44),
          Transform.scale(
            scale: 2.0,
            // Increase the scale factor to 2.0 for both width and height
            child: GenderChoiceChip(
              gender: "           Woman           ",
              selectedGender: genderSelection,
              onSelected: _onGenderSelected,
            ),
          ),
          const SizedBox(height: 36.0),
          Transform.scale(
            scale: 2.0,
            // Increase the scale factor to 2.0 for both width and height
            child: GenderChoiceChip(
              gender: "              Man              ",
              selectedGender: genderSelection,
              onSelected: _onGenderSelected,

            ),
          ),
          const SizedBox(height: 36.0),
          Transform.scale(
            scale: 2.0,
            // Increase the scale factor to 2.0 for both width and height
            child: FilterChip(
              label: const Text('Without Answer'),
              selected: genderSelection?.isEmpty ?? true,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    genderSelection = '';
                  }
                });
              },
            ),
          ),
          const SizedBox(height: 32.0),
          GestureDetector(
            onTap: _showInformationPopup,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.info),
                SizedBox(width: 8.0),
                Text('Зачем этот вопрос?'),
              ],
            ),
          ),
          const SizedBox(height: 152.0),
          Transform.scale(
            scale: 2.0,
            child: ElevatedButton(
              onPressed: () {
                _navigateToRulesScreen();
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20.0), // Increase the radius to 20.0
                ),
              ),
              child: const Text('         Continue         '),
            ),
          ),
        ],
      ),
    );
  }
}
