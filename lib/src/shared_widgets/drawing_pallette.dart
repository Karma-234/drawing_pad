import 'package:custom_paint_animation/src/model/drawing.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../misc/enums.dart';
import 'app_icon.dart';

class DrawingPallette extends StatelessWidget {
  const DrawingPallette({
    super.key,
    required this.strokeColor,
    required this.selectedrawingType,
    required this.drawings,
    required this.activeDraving,
  });

  final ValueNotifier<Color> strokeColor;
  final ValueNotifier<DrawingType> selectedrawingType;
  final ValueNotifier<List<Drawing>> drawings;
  final ValueNotifier<Drawing?> activeDraving;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(12),
            bottom: Radius.circular(12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Colors',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 4,
            ),
            AppColorPalette(strokeColor: strokeColor),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Drawing Style',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 4,
            ),
            DrawingStyles(selectedrawingType: selectedrawingType),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppIconWithtextButton(
                  color: Colors.red,
                  icon: Icons.clear,
                  text: 'Clear',
                  onTap: () {
                    drawings.value = [];
                    activeDraving.value = null;
                  },
                ),
                const SizedBox(
                  width: 16,
                ),
                AppIconWithtextButton(
                  onTap: () {
                    var holder = drawings.value;
                    if (holder.isNotEmpty) {
                      holder.removeLast();
                      drawings.value = holder;
                      activeDraving.value = null;
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppIconWithtextButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onTap;
  final IconData icon;
  const AppIconWithtextButton({
    super.key,
    this.text = 'Undo',
    this.color = Colors.blue,
    this.onTap,
    this.icon = LineIcons.undo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            icon,
            size: 16,
            color: color,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: color),
          ),
        ],
      ),
    );
  }
}

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
