import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/pages/details.dart';
import '../data/data.dart';
import 'model_items.dart';

class Model extends StatefulWidget {
  final double padding;
  final double spacing;

  const Model({
    Key? key,
    required this.padding,
    required this.spacing,
  }) : super(key: key);

  @override
  State<Model> createState() => _ModelState();
}

class _ModelState extends State<Model> {
  late final ScrollController _scrollController;
  late final double _indexFactor;

  static const _imageWidth = 180.0;
  double _imageOffset = 0.0;

  @override
  void initState() {
    final deviceWidth =
        (window.physicalSize.shortestSide / window.devicePixelRatio);
    _indexFactor = (widget.spacing + _imageWidth) / deviceWidth;
    _imageOffset = -widget.padding / deviceWidth;

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _imageOffset =
            ((_scrollController.offset - widget.padding) / deviceWidth);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: widget.padding),
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => SizedBox(width: widget.spacing),
        itemCount: data.length,
        itemBuilder: (_, index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Details(
                      index: index, hero: "${data[index]["city"]}$index")),
            );
          },
          child: SizedBox(
            height: 240,
            width: 200,
            child: Card(
              elevation: 3,
              // color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: ModelItems(
                          index: index,
                          imageWidth: _imageWidth,
                          imageOffset: _imageOffset,
                          indexFactor: _indexFactor,
                          hero: "${data[index]["city"]}$index"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      // color: Colors.green,
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                          left: 15, bottom: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            data[index]["city"],
                            style: const TextStyle(
                              color: kSecondaryColor,
                              fontSize: 22,
                              letterSpacing: 1.3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.locationDot,
                                color: kSecondaryColor.withOpacity(0.5),
                                size: 18,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                data[index]["city"],
                                style: TextStyle(
                                  color: kSecondaryColor.withOpacity(0.5),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
