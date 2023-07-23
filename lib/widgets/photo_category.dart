import 'package:flutter/material.dart';

class PhotoCategory extends StatelessWidget {
  final String title;
  final List<String> goodPhotos;
  final List<String> badPhotos;

  PhotoCategory({
    required this.title,
    required this.goodPhotos,
    required this.badPhotos,
  });

  // Function to randomly select photos from the provided folders
  List<String> _getRandomPhotosFromFolders(List<String> folderPaths) {
    final List<String> selectedPhotos = [];

    for (final folderPath in folderPaths) {
      for (int i = 1; i <= 5; i++) {
        final photoPath = '$folderPath$i.jpg';
        selectedPhotos.add(photoPath);
      }
    }

    // Shuffle the list to get random photos
    selectedPhotos.shuffle();
    return selectedPhotos;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Implement your UI here using goodPhotos and badPhotos lists
        // For example, you can use ListView.builder to display the photos in a scrollable list
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: goodPhotos.length,
          itemBuilder: (context, index) {
            final goodPhotoPath = goodPhotos[index];
            final badPhotoPath = badPhotos[index];
            // Create widgets using the photo paths, e.g., Image.asset(goodPhotoPath)
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    goodPhotoPath,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    badPhotoPath,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}