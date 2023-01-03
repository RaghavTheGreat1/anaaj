import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum DietType {
  vegetarian,
  nonVegetarian,
  eggetarian,
}

extension DietTypeExtension on DietType {
  static DietType getByIndex(int index) {
    return DietType.values.elementAt(index);
  }

  String get displayName {
    String name;
    switch (this) {
      case DietType.vegetarian:
        name = 'Vegetarian';
        break;
      case DietType.nonVegetarian:
        name = 'Non-Vegetarian';
        break;
      case DietType.eggetarian:
        name = 'Eggetarian';
        break;
      default:
        name = 'Vegetarian';
        break;
    }
    return name;
  }

  DietType parseDisplayName(String dietTypeAsString) {
    DietType dietType;
    switch (dietTypeAsString) {
      case 'Vegetarian':
        dietType = DietType.vegetarian;
        break;
      case 'Non-Vegetarian':
        dietType = DietType.nonVegetarian;
        break;
      case 'Eggetarian':
        dietType = DietType.eggetarian;
        break;
      default:
        dietType = DietType.vegetarian;
        break;
    }
    return dietType;
  }

  IconData get getIconData {
    IconData iconData;
    switch (this) {
      case DietType.vegetarian:
        iconData = FontAwesomeIcons.leaf;
        break;
      case DietType.nonVegetarian:
        iconData = FontAwesomeIcons.drumstickBite;
        break;
      case DietType.eggetarian:
        iconData = FontAwesomeIcons.egg;
        break;
      default:
        iconData = FontAwesomeIcons.leaf;

        break;
    }
    return iconData;
  }
}
