import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../data/data.dart';

class ModelItems extends StatelessWidget {
  final int index;
  final double imageWidth;
  final double imageOffset;
  final double indexFactor;
  final String hero;

  const ModelItems(
      {Key? key,
      required this.index,
      required this.imageWidth,
      required this.imageOffset,
      required this.indexFactor,
      required this.hero})
      : super(key: key);

  Widget image() {
    return Hero(
      tag: hero,
      child: Image.asset(
        data[index]["image"],
        fit: BoxFit.cover,
        alignment: Alignment(-imageOffset + indexFactor * index, 0),
      ),
    );
  }

  Widget rating() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              height: 48,
              color: kSecondaryColor.withOpacity(0.4),
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      FontAwesomeIcons.solidStar,
                      color: Color(0xFFFFD600),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        data[index]["rating"],
                        style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget favoriteIcon() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Container(
            width: 48,
            height: 48,
            color: Colors.white,
            child: const Icon(
              FontAwesomeIcons.heart,
              color: Colors.black87,
            ),
          ),
          /*
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              width: 48,
              height: 48,
              color: kSecondaryColor.withOpacity(0.4),
              child: const Icon(
                FontAwesomeIcons.heart,
                color: kPrimaryColor,
              ),
            ),
          ), */
        ),
      ),
    );
  }

  Widget bottomText() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              height: 48,
              color: kSecondaryColor.withOpacity(0.4),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.locationDot,
                      color: kPrimaryColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      data[index]["city"],
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ', ${data[index]["country"]}',
                      style: TextStyle(
                        color: kPrimaryColor.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imageWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          fit: StackFit.expand,
          children: [
            image(),
            // rating(),
            favoriteIcon(),
            // bottomText(),
          ],
        ),
      ),
    );
  }
}
