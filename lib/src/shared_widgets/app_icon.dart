import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class AppIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isSelected;
  final IconData iconData;
  final String label;
  final Widget? child;
  final bool showLabel;
  final Color? color;
  final double? size;
  const AppIcon(
      {super.key,
      this.isSelected = false,
      this.iconData = LineIcons.eraser,
      this.onTap,
      this.label = "Eraser",
      this.child,
      this.showLabel = true,
      this.color,
      this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: size,
            width: size,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color,
              border: Border.all(
                  width: showLabel ? 1 : 2,
                  color: isSelected
                      ? showLabel
                          ? Colors.black
                          : Colors.purpleAccent
                      : showLabel
                          ? Colors.grey
                          : color!),
              borderRadius: BorderRadius.circular(8),
            ),
            child: showLabel
                ? child ??
                    Icon(
                      iconData,
                      color: isSelected ? Colors.black : Colors.grey,
                    )
                : null,
          ),
          if (showLabel)
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: isSelected ? Colors.black : Colors.grey),
            )
        ],
      ),
    );
  }
}
