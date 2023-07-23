import 'dart:io';

import 'package:flutter/material.dart';

class CheckScreen extends StatelessWidget {
  final List<String> selectedPhotos;

  CheckScreen({required this.selectedPhotos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Photos'),
      ),
      body: ListView.builder(
        itemCount: selectedPhotos.length,
        itemBuilder: (context, index) {
          final photoPath = selectedPhotos[index];
          return ListTile(
            leading: Image.file(
              File(photoPath),
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            title: Text('Photo ${index + 1}'),
          );
        },
      ),
    );
  }
}
