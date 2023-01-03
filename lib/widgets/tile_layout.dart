import 'package:flutter/material.dart';

class TileLayout extends StatelessWidget {
  const TileLayout({
    Key? key,
    this.onTap,
    required this.listTile,
  }) : super(key: key);

  final GestureTapCallback? onTap;

  final Widget listTile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: listTile,
          ),
          const Divider(
            height: 1,
            thickness: 0.05,
          ),
        ],
      ),
    );
  }
}
