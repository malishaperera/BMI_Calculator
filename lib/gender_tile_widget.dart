// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'constants.dart';

class GenderTileWidget extends StatelessWidget {
  final bool isMale;
  final String text;
  final IconData icon;
  final Function onTapTile;
  // This should be passed as a parameter or managed by state
  const GenderTileWidget({
    super.key,
    required this.isMale,
    required this.onTapTile,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapTile(),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration:
            isMale ? kSelectedTileBorderDecoration : kTileBorderDecoration,
        child: Column(
          children: [
            Icon(icon, size: 50, color: kActiveTextColor),
            Text(
              text,
              style: const TextStyle(fontSize: 24, color: kActiveTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
