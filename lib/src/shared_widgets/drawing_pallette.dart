import 'package:custom_paint_animation/src/model/drawing.dart';
import 'package:flutter/material.dart';

import '../misc/enums.dart';
import 'app_color_palette.dart';
import 'app_icon_with_text_button.dart';
import 'drawing_styles.dart';

class CustomDrawingAppBar extends StatelessWidget {
  const CustomDrawingAppBar({
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
                    if (drawings.value.isNotEmpty) {
                      activeDraving.value = drawings.value.last;
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
