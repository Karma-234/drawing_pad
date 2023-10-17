import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

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
