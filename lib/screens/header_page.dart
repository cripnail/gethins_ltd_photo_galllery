import 'package:flutter/material.dart';
import '../widgets/age_confirmation_checkbox.dart';
import '../widgets/gallery_widget.dart';
import 'gender_selection_screen.dart';

class HeaderPage extends StatefulWidget {
  @override
  _HeaderPageState createState() => _HeaderPageState();
}

class _HeaderPageState extends State<HeaderPage> {
  bool isAgeConfirmed = false;

  void _onAgeConfirmationChanged(bool? value) {
    setState(() {
      isAgeConfirmed = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Header'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const Text(
              'В нашем приложении мы используем искуственный интеллект, который может выдавать некоторые неточности (артефакты)',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
                'Чем больше вариантов будет сгенерировано, тем больше шансов на классный результат',
                textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold, // Set the text to bold
              ),
            ),
            GalleryWidget(
              images: const [
                'assets/woman-good/00107-365445646.png',
                'assets/woman-good/00111-365445650.png',
                'assets/woman-good/00135-1788044796.png',
                'assets/woman-good/00136-1788044797.png',
                'assets/woman-good/00137-1788044798.png',
                'assets/woman-good/00138-1788044799.png',
                'assets/woman-good/00139-1788044800.png',
                'assets/woman-good/00140-1788044801.png',
                'assets/woman-good/00141-1788044802.png',
              ],
              isSuccessful: true,
              onGenerationSwitch: (value) {
                // Handle successful generation switch here
              },
            ),
            GalleryWidget(
              images: const [
                'assets/man-bad/00051-4225152271.png',
                'assets/man-bad/00052-4225152272.png',
                'assets/man-bad/00054-4225152274.png',
                'assets/man-bad/00054-4225152274.png',
                'assets/man-bad/00065-1237237229.png',
                'assets/man-bad/00066-1237237230.png',
                'assets/man-bad/00072-1237237236.png',
                'assets/man-bad/00075-3120522223.png',
                'assets/man-bad/00076-3120522224.png',
                'assets/man-bad/00077-3120522225.png',
                'assets/man-bad/00083-3120522231.png'
              ],
              isSuccessful: false,
              onGenerationSwitch: (value) {
                // Handle unsuccessful generation switch here
              },
            ),
            AgeConfirmationCheckbox(
              isConfirmed: isAgeConfirmed,
              onChanged: _onAgeConfirmationChanged,
            ),
            const SizedBox(height: 16),
            FractionallySizedBox(
              widthFactor: 0.4,
              child: Transform.scale(
                scale: 2.0,
                child: ElevatedButton(
                  onPressed: isAgeConfirmed
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GenderSelectionScreen(),
                            ),
                          );
                        }
                      : null,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // Increase the radius to 20.0
                    ),//<-- SEE HERE
                  ),
                  child: const Text('Continue'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
