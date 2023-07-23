import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GalleryWidget extends StatefulWidget {
  final List<String> images;
  final bool isSuccessful;
  final ValueChanged<bool?> onGenerationSwitch;

  GalleryWidget({
    required this.images,
    required this.isSuccessful,
    required this.onGenerationSwitch,
  });

  @override
  _GalleryWidgetState createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: widget.isSuccessful,
              onChanged: widget.onGenerationSwitch,
            ),
            Text(widget.isSuccessful
                ? 'Удачная генерация'
                : 'Неудачная генерация'), // Text to the right of the Checkbox
          ],
        ),
        Container(
          height: 200,
          child: CarouselSlider.builder(
            itemCount: widget.images.length,
            itemBuilder: (context, index, realIndex) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  children: [
                    for (int i = 0;
                        i < 3;
                        i++) // Display 3 images within the padding
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Image.asset(
                            widget.images[(index + i) % widget.images.length],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
            options: CarouselOptions(
              height: 200,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: widget.images.length > 3,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ],
    );
  }
}
