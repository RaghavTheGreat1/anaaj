enum DietType {
  vegetarian,
  nonVegetarian,
  eggetarian,
}

extension DietTypeExtension on DietType {
  static DietType getByIndex(int index) {
    return DietType.values.elementAt(index);
  }

  String displayName(DietType dietType) {
    String name;
    switch (dietType) {
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
}
