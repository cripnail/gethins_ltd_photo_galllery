import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/photo_category.dart';

class RulesScreen extends StatefulWidget {
  final String? selectedGender;

  RulesScreen({this.selectedGender = ''});

  @override
  _RulesScreenState createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen> {
  bool showGoodPhotos = true;
  bool showBadPhotos = true;

  List<String> femaleGoodPhotos = [
    'assets/woman-good/00107-365445646.png',
    'assets/woman-good/00111-365445650.png',
    'assets/woman-good/00135-1788044796.png',
    'assets/woman-good/00136-1788044797.png',
    'assets/woman-good/00137-1788044798.png',
    'assets/woman-good/00138-1788044799.png',
    'assets/woman-good/00139-1788044800.png',
    'assets/woman-good/00140-1788044801.png',
    'assets/woman-good/00141-1788044802.png',
    // Add more photos here...
  ];

  List<String> femaleBadPhotos = [
    'assets/woman-bad/00085-3559810726.png',
    'assets/woman-bad/00086-3559810727.png',
    'assets/woman-bad/00087-3559810728.png',
    'assets/woman-bad/00088-3559810729.png',
    'assets/woman-bad/00089-3559810730.png',
    'assets/woman-bad/00091-3559810732.png',
    'assets/woman-bad/00092-3559810733.png',
    'assets/woman-bad/00096-2430270104.png',
    // Add more photos here...
  ];

  List<String> maleGoodPhotos = [
    'assets/man-good/00011-3378978445.png',
    'assets/man-good/00012-3378978446.png',
    'assets/man-good/00013-3378978447.png',
    'assets/man-good/00014-3378978448.png',
    'assets/man-good/00015-3378978449.png',
    'assets/man-good/00016-3378978450.png',
    'assets/man-good/00017-3378978451.png',
    'assets/man-good/00018-3378978452.png',
    'assets/man-good/00019-3378978453.png',
    'assets/man-good/00020-3378978454.png',
  ];

  List<String> maleBadPhotos = [
    'assets/man-bad/00051-4225152271.png',
    'assets/man-bad/00052-4225152272.png',
    'assets/man-bad/00054-4225152274.png',
    'assets/man-bad/00065-1237237229.png',
    'assets/man-bad/00066-1237237230.png',
    'assets/man-bad/00072-1237237236.png',
    'assets/man-bad/00075-3120522223.png',
    'assets/man-bad/00076-3120522224.png',
    'assets/man-bad/00077-3120522225.png',
    'assets/man-bad/00083-3120522231.png',
  ];

  List<String> withoutAnswerGoodPhotos = [
    'assets/man-good/00018-3378978452.png',
    'assets/woman-good/00136-1788044797.png',
    'assets/man-good/00020-3378978454.png',
    'assets/woman-good/00138-1788044799.png',
    // Add photos...
  ];

  List<String> withoutAnswerBadPhotos = [
    'assets/man-bad/00075-3120522223.png',
    'assets/woman-bad/00092-3559810733.png',
    'assets/man-bad/00083-3120522231.png',
    'assets/woman-bad/00091-3559810732.png',
    // Add photos...
  ];

  late List<PhotoCategory> photoCategories;

  @override
  void initState() {
    super.initState();
    print("Selected Gender in RulesScreen: ${widget.selectedGender}");

    // Create the list of PhotoCategory objects with the required arguments
    photoCategories = [
      PhotoCategory(
        title: 'Female',
        goodPhotos: femaleGoodPhotos,
        badPhotos: femaleBadPhotos,
      ),
      PhotoCategory(
        title: 'Male',
        goodPhotos: maleGoodPhotos,
        badPhotos: maleBadPhotos,
      ),
      PhotoCategory(
        title: 'Without Answer',
        goodPhotos: withoutAnswerGoodPhotos,
        badPhotos: withoutAnswerBadPhotos,
      ),
    ];
  }

  void _onGoodPhotosCheckboxChanged(bool? value) {
    setState(() {
      showGoodPhotos = value ?? false;
    });
  }

  void _onBadPhotosCheckboxChanged(bool? value) {
    setState(() {
      showBadPhotos = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Find the corresponding PhotoCategory based on the selected gender
    final selectedCategory = photoCategories.firstWhere(
      (category) =>
          category.title.toLowerCase() ==
          (widget.selectedGender?.toLowerCase() ?? "").toLowerCase(),
      orElse: () => photoCategories[2], // Default to "Without Answer" category
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rules Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text(
                "На фото должен быть один и тот же человек с разным освещением, ракурсом и наклоном головы. Без головных уборов, очков и загораживающих лицо предметов/вещейю",
                textAlign: TextAlign.center),
            const SizedBox(height: 16.0),
            Row(
              children: [
                SizedBox(width: 32),
                Checkbox(
                  value: showGoodPhotos,
                  onChanged: _onGoodPhotosCheckboxChanged,
                ),
                const Expanded(
                  child: Text(
                    'Удачные фото',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Visibility(
                visible: showGoodPhotos,
                child: CarouselSlider.builder(
                  itemCount: showGoodPhotos
                      ? (selectedCategory.goodPhotos.length / 3).ceil()
                      : 0,
                  itemBuilder: (context, index, realIndex) {
                    final startIndex = index * 3;
                    final endIndex = (index * 3 + 2)
                        .clamp(0, selectedCategory.goodPhotos.length - 1);

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (startIndex <= endIndex)
                          Image.asset(selectedCategory.goodPhotos[startIndex],
                              width: 100, height: 100),
                        if (startIndex + 1 <= endIndex)
                          Image.asset(
                              selectedCategory.goodPhotos[startIndex + 1],
                              width: 100,
                              height: 100),
                        if (startIndex + 2 <= endIndex)
                          Image.asset(
                              selectedCategory.goodPhotos[startIndex + 2],
                              width: 100,
                              height: 100),
                      ],
                    );
                  },
                  options: CarouselOptions(
                    // Add your desired carousel options here
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {},
                  ),
                )),
            Row(
              children: [
                SizedBox(width: 32),
                Checkbox(
                  value: showBadPhotos,
                  onChanged: _onBadPhotosCheckboxChanged,
                ),
                const Expanded(
                  child: Text(
                    'Неудачные фото',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Visibility(
                visible: showBadPhotos,
                child: CarouselSlider.builder(
                  itemCount: (showBadPhotos
                      ? (selectedCategory.badPhotos.length / 3).ceil()
                      : 0),
                  itemBuilder: (context, index, realIndex) {
                    final startIndex = index * 3;
                    final endIndex = (index * 3 + 2)
                        .clamp(0, selectedCategory.badPhotos.length - 1);

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (var i = startIndex; i <= endIndex; i++)
                          Image.asset(selectedCategory.badPhotos[i],
                              width: 100, height: 100),
                      ],
                    );
                  },
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    viewportFraction: 1.0,
                    // Set viewportFraction to 1.0 for full-width display
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {},
                  ),
                )),
            const SizedBox(height: 16.0),
            Center(
              child: Transform.scale(
                scale: 1.7,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Handle button click
                  },
                  icon: const Icon(CupertinoIcons.square_arrow_up),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Increase the radius to 20.0
                    ), //<-- SEE HERE
                  ),
                  label: const Text('Choose 10-15 photos'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
