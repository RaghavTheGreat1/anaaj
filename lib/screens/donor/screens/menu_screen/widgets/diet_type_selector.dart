import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DietTypeSelector extends StatefulWidget {
  const DietTypeSelector({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<int> onChanged;

  @override
  State<DietTypeSelector> createState() => _DietTypeSelectorState();
}

class _DietTypeSelectorState extends State<DietTypeSelector>
    with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
      animationDuration: const Duration(milliseconds: 700),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TabBar(
        isScrollable: true,
        controller: controller,
        onTap: (int value) {
          controller.animateTo(
            value,
            curve: Curves.easeIn,
          );
          widget.onChanged(value);
          setState(() {});
        },
        indicator: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        tabs: [
          _CustomTab(
            label: 'Veg',
            icon: Icon(FontAwesomeIcons.leaf),
            isSelected: controller.index == 0,
          ),
          _CustomTab(
            label: 'Non Veg',
            icon: Icon(FontAwesomeIcons.drumstickBite),
            isSelected: controller.index == 1,
          ),
          _CustomTab(
            label: 'Egg',
            icon: Icon(FontAwesomeIcons.egg),
            isSelected: controller.index == 2,
          ),
        ],
      ),
    );
  }
}

class _CustomTab extends StatelessWidget {
  const _CustomTab({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
  }) : super(key: key);
  final Icon icon;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Tab(
        child: Row(
          children: [
            TweenAnimationBuilder(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 500),
              tween: isSelected
                  ? ColorTween(
                      end: Theme.of(context).colorScheme.onPrimary,
                      begin: Theme.of(context).colorScheme.primary,
                    )
                  : ColorTween(
                      begin: Theme.of(context).colorScheme.onPrimary,
                      end: Theme.of(context).colorScheme.primary,
                    ),
              builder: (context, color, _) {
                return IconTheme(
                  data: IconThemeData(
                    color: color,
                    size: 18,
                  ),
                  child: icon,
                );
              },
            ),
            const SizedBox(
              width: 8,
            ),
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 700),
              tween: isSelected
                  ? Tween(
                      end: 1,
                      begin: 0,
                    )
                  : Tween(
                      begin: 1,
                      end: 0,
                    ),
              child: Visibility(
                visible: isSelected,
                maintainAnimation: true,
                maintainState: true,
                child: TweenAnimationBuilder(
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 700),
                  tween: isSelected
                      ? ColorTween(
                          end: Theme.of(context).colorScheme.onPrimary,
                          begin: Theme.of(context).colorScheme.primary,
                        )
                      : ColorTween(
                          begin: Theme.of(context).colorScheme.onPrimary,
                          end: Theme.of(context).colorScheme.primary,
                        ),
                  builder: (context, color, _) {
                    return TweenAnimationBuilder<Offset>(
                      duration: const Duration(milliseconds: 400),
                      tween: isSelected
                          ? Tween(
                              begin: const Offset(-0.24, 0),
                              end: const Offset(0, 0),
                            )
                          : Tween(
                              end: const Offset(-0.24, 0),
                              begin: const Offset(0, 0),
                            ),
                      builder: (context, offset, kid) {
                        return AnimatedSlide(
                          duration: const Duration(milliseconds: 400),
                          offset: offset,
                          child: kid,
                        );
                      },
                      child: Text(
                        label,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: color,
                            ),
                      ),
                    );
                  },
                ),
              ),
              builder: (context, opacity, kid) {
                return Opacity(
                  opacity: opacity,
                  child: kid,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
