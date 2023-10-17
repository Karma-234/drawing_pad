import 'package:flutter/material.dart';

import 'app_icon.dart';

class AppColorPalette extends StatelessWidget {
  const AppColorPalette({
    super.key,
    required this.strokeColor,
  });

  final ValueNotifier<Color> strokeColor;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      runSpacing: 4,
      spacing: 4,
      children: [
        ...<Color>[
          Colors.black12,
          Colors.black26,
          Colors.black38,
          Colors.black45,
          Colors.black54,
          Colors.black87,
          Colors.black,
          Colors.grey[400]!,
          Colors.grey,
          Colors.grey[600]!,
          Colors.grey[700]!,
          Colors.red[100]!,
          Colors.red[200]!,
          Colors.red[300]!,
          Colors.red[400]!,
          Colors.red[500]!,
          Colors.green[100]!,
          Colors.green[200]!,
          Colors.green[300]!,
          Colors.green[400]!,
          Colors.green[500]!,
        ]
            .map((e) => AppIcon(
                  color: e,
                  showLabel: false,
                  size: 20,
                  onTap: () => strokeColor.value = e,
                  isSelected: strokeColor.value == e,
                ))
            .toList()
      ],
    );
  }
}
