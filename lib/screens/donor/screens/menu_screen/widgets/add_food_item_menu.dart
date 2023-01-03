import 'package:flutter/material.dart';

import '../../../../../models/diet_type.dart';
import '../../../../../models/food_item.dart';
import '../../../../../widgets/buttons/loader_button.dart';
import '../../../../../widgets/textfields/custom_text_form_field.dart';
import 'diet_type_selector.dart';

class AddFoodItemMenu extends StatelessWidget {
  const AddFoodItemMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FoodItem foodItem = FoodItem.raw();
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'add food item',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'food name',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CustomTextFormField(
                    onChanged: (value) {
                      foodItem = foodItem.copyWith(
                        name: value,
                      );
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'diet type',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: DietTypeSelector(
                          onChanged: (value) {
                            foodItem = foodItem.copyWith(
                              dietType: DietTypeExtension.getByIndex(value),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: LoaderButton(
                      label: Text('done'),
                      onPressed: () async {
                        //TODO: Implement add food
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
