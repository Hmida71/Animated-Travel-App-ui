import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';

import '../../data/data.dart';

class Details extends StatefulWidget {
  final int index;
  final String hero;
  const Details({Key? key, required this.index, required this.hero})
      : super(key: key);

  @override
  State<Details> createState() => DdetailsState();
}

class DdetailsState extends State<Details> {
  final _controller = ScrollController();
  ScrollPhysics _physics = const ClampingScrollPhysics();
  bool appBarVAR = false;
  bool bottomBarImagesVAR = false;

  Future run() async {
    await Future.delayed(const Duration(milliseconds: 350));
    setState(() {
      appBarVAR = true;
      bottomBarImagesVAR = true;
    });
  }

  @override
  void initState() {
    super.initState();
    try {
      run();
    } catch (e) {
      debugPrint("$e");
    }
    _controller.addListener(() {
      if (_controller.position.pixels <= 100) {
        setState(() => _physics = const ClampingScrollPhysics());
      } else {
        setState(() => _physics = const BouncingScrollPhysics());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double displayHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SafeArea(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: _controller,
            physics: _physics,
            child: Column(
              children: [
                Material(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  elevation: 4,
                  child: Hero(
                    tag: widget.hero,
                    child: Container(
                      height: displayHeight / 2,
                      width: displayWidth,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40)),
                          image: DecorationImage(
                              image: AssetImage(data[widget.index]["image"]),
                              fit: BoxFit.cover)),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          AnimatedCrossFade(
                            firstChild: Container(),
                            secondChild: appBar(),
                            crossFadeState: appBarVAR
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            duration: const Duration(milliseconds: 400),
                          ),
                          AnimatedCrossFade(
                            firstChild: Container(),
                            secondChild: bottomBarImages(),
                            crossFadeState: appBarVAR
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            duration: const Duration(milliseconds: 600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: displayWidth,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[widget.index]["city"],
                            style: const TextStyle(
                              color: kSecondaryColor,
                              fontSize: 25,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            data[widget.index]["country"],
                            style: const TextStyle(
                              color: kSecondaryColor,
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            "\$20",
                            style: TextStyle(
                              color: kSecondaryColor,
                              fontSize: 24,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "per person",
                            style: TextStyle(
                              color: kSecondaryColor,
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black38.withOpacity(0.2),
                  endIndent: 20,
                  indent: 20,
                  height: 4,
                ),
                const SizedBox(height: 15),
                const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xffeaeaea),
                    radius: 26,
                    child: Icon(
                      FontAwesomeIcons.locationDot,
                      color: kSecondaryColor,
                    ),
                  ),
                  title: Text(
                    "Pizza del Colosseum 1, Rome",
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                ListTile(
                  isThreeLine: false,
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xffeaeaea),
                    radius: 26,
                    child: Icon(
                      Ionicons.time_outline,
                      color: kSecondaryColor,
                    ),
                  ),
                  title: Text(
                    "OPEN",
                    style: TextStyle(
                      color: kSecondaryColor.withOpacity(0.4),
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  subtitle: const Text(
                    "09.00 AM",
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "showDetails ",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  width: displayWidth,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      image: DecorationImage(
                          image: AssetImage("assets/images/map.jpg"),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          )),
          Container(
              margin: EdgeInsets.all(displayWidth * .05),
              height: displayWidth * .155,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Color(0xff140c47),
                  borderRadius: BorderRadius.all(Radius.circular(35))),
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Book Now ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Ionicons.arrow_forward_outline,
                      color: Colors.white,
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget appBar() {
    return Row(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Container(
                  width: 48,
                  height: 48,
                  color: Colors.white,
                  child: const Icon(
                    Ionicons.arrow_back_outline,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        Align(
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
                  Ionicons.download_outline,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
        Align(
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
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomBarImages() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              height: 90,
              color: kSecondaryColor.withOpacity(0.25),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    ...List.generate(
                        data.length,
                        (index) => Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(24)),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    data[index]["image"]),
                                                fit: BoxFit.cover)),
                                      ),
                                      index == (data.length - 1)
                                          ? Container(
                                              color: Colors.blue.shade800
                                                  .withOpacity(0.4),
                                              child: const Center(
                                                child: Text(
                                                  "+5",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),
                              ),
                            ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
