import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../misc/enums.dart';
import 'app_icon.dart';

class DrawingStyles extends StatelessWidget {
  const DrawingStyles({
    super.key,
    required this.selectedrawingType,
  });

  final ValueNotifier<DrawingType> selectedrawingType;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      runSpacing: 8,
      spacing: 8,
      children: [
        AppIcon(
          onTap: () => selectedrawingType.value = DrawingType.eraser,
          isSelected: selectedrawingType.value == DrawingType.eraser,
        ),
        AppIcon(
          onTap: () => selectedrawingType.value = DrawingType.scribble,
          iconData: LineIcons.pen,
          label: "Draw",
          isSelected: selectedrawingType.value == DrawingType.scribble,
        ),
        AppIcon(
          onTap: () => selectedrawingType.value = DrawingType.rectangle,
          iconData: LineIcons.square,
          label: "Rectangle",
          isSelected: selectedrawingType.value == DrawingType.rectangle,
        ),
        AppIcon(
          onTap: () => selectedrawingType.value = DrawingType.circle,
          iconData: LineIcons.circle,
          label: "Circle",
          isSelected: selectedrawingType.value == DrawingType.circle,
        ),
        AppIcon(
          onTap: () => selectedrawingType.value = DrawingType.oval,
          iconData: LineIcons.egg,
          label: "Oval",
          isSelected: selectedrawingType.value == DrawingType.oval,
        ),
      ],
    );
  }
}
