import 'package:anaaj/models/marketplace_entity.dart';
import 'package:anaaj/screens/donor/providers/marketplace_entity_provider.dart';
import 'package:anaaj/screens/donor/services/donor_marketplace_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../models/diet_type.dart';
import '../../../../../models/food_item.dart';
import '../../../../../widgets/buttons/loader_button.dart';
import '../../../../../widgets/textfields/custom_text_form_field.dart';
import 'diet_type_selector.dart';

class AddFoodItemMenu extends HookConsumerWidget {
  const AddFoodItemMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                        MarketplaceEntity entity =
                            ref.read(marketplaceEntityProvider)!;
                        DonorMarketplaceService service =
                            DonorMarketplaceService(marketplaceEntity: entity);
                        await service.addFoodItem(foodItem);
                        Navigator.pop(context);
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
