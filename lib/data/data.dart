import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

// ! Routing
int currentIndex = 0;
// ! Routing

List bottomBar = [
  const Icon(
    Ionicons.home_outline,
    color: Colors.white,
  ),
  const Icon(
    Ionicons.compass_outline,
    color: Colors.white,
  ),
  const Icon(
    Ionicons.bookmark_outline,
    color: Colors.white,
  ),
  const Icon(
    Ionicons.person_outline,
    color: Colors.white,
  ),
];

List data = [
  {
    "city": 'Nassau',
    "country": 'Bahamas',
    "rating": '4.6',
    'image': 'assets/images/nassau.jpg'
  },
  {
    "city": 'Mykonos',
    "country": 'Greece',
    "rating": '4.8',
    'image': 'assets/images/mykonos.jpg'
  },
  {
    "city": 'Colosseum',
    "country": 'Rome',
    "rating": '4.4',
    'image': 'assets/images/rome.jpg'
  },
  {
    "city": 'London',
    "country": 'England',
    "rating": '4.5',
    'image': 'assets/images/london.jpg'
  },
];
List data_2 = [
  {"name": 'Flaye', 'image': 'assets/images/flaye.png'},
  {"name": 'Beach', 'image': 'assets/images/beach.png'},
  {"name": 'Park', 'image': 'assets/images/park.png'},
  {"name": 'Camp', 'image': 'assets/images/camp.png'},
  {"name": 'Flaye', 'image': 'assets/images/flaye.png'},
  {"name": 'Beach', 'image': 'assets/images/beach.png'},
  {"name": 'Park', 'image': 'assets/images/park.png'},
  {"name": 'Camp', 'image': 'assets/images/camp.png'},
];
final categoryList = ['Populare', 'Recommended', 'Most Viewd', 'Most Liked'];

// Colors
const kAvatarColor = Color(0xffffdbc9);
const kPrimaryColor = Color(0xFFEEF7FF);
const kSecondaryColor = Color(0xFF29303D);
