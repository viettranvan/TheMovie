import 'package:flutter/material.dart';

const String image =
    'https://image.tmdb.org/t/p/w500/jOuCWdh0BE6XPu2Vpjl08wDAeFz.jpg';
const String image2 =
    'https://image.tmdb.org/t/p/w500/qtX2Fg9MTmrbgN1UUvGoCsImTM8.jpg';

const ImageProvider placeholderImage =  AssetImage('assets/images/placeholder.gif');

String getGender(int gender){
  String result = '';

  switch(gender){
    case 0:
      result = 'Not specified';
      break;
    case 1:
      result = 'Female';
      break;
    case 2:
      result = 'Male';
      break;
    default:
      result = 'Not specified';
      break;
  }

  return result;
}

IconData getIconDataGender(int gender){
  IconData result;

  switch(gender){
    case 0:
      result = Icons.nature_people_outlined;
      break;
    case 1:
      result = Icons.female;
      break;
    case 2:
      result = Icons.male;
      break;
    default:
      result = Icons.nature_people_outlined;
      break;
  }

  return result;
}