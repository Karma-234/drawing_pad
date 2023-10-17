import 'dart:ui';

import 'package:custom_paint_animation/src/misc/enums.dart';
import 'package:custom_paint_animation/src/model/drawing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../shared_widgets/custom_drawer.dart';
import '../shared_widgets/drawing_pallette.dart';
import 'sample_item.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends HookWidget {
  const SampleItemListView({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    final selectedrawingType = useState(DrawingType.scribble);
    final drawaingPadKey = GlobalKey();
    final strokeColor = useState(Colors.black);
    final strokeWidth = useState(10);
    final allDrawings = useState(<Drawing>[]);
    final activeDarwing = useState<Drawing?>(null);
    final animationController = useAnimationController(
      initialValue: 1,
      duration: const Duration(milliseconds: 200),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: Colors.grey[400],
          shape: BoxShape.circle,
        ),
        child: IconButton.filled(
          hoverColor: Colors.black,
          onPressed: () {
            if (animationController.value == 0) {
              animationController.forward();
            } else {
              animationController.reverse();
            }
          },
          icon: Icon(animationController.value == 0
              ? Icons.keyboard_arrow_down
              : Icons.keyboard_arrow_up),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          RepaintBoundary(
            key: drawaingPadKey,
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: CustomPaint(
                painter: CustomDrawer(drawings: allDrawings.value),
              ),
            ),
          ),
          Listener(
            onPointerMove: (details) {
              final box = context.findRenderObject() as RenderBox;
              final offset = box.globalToLocal(details.position);
              // final offset = details.globalPosition;
              final points =
                  List<Offset>.from(activeDarwing.value?.points ?? [])
                    ..add(offset);
              activeDarwing.value = Drawing(
                points: points,
                color: selectedrawingType.value == DrawingType.eraser
                    ? Colors.white
                    : strokeColor.value,
                size: strokeWidth.value.toDouble(),
                type: selectedrawingType.value,
              );
            },
            onPointerDown: (details) {
              final box = context.findRenderObject() as RenderBox;
              final offset = box.globalToLocal(details.position);
              // final offset = details.globalPosition;
              activeDarwing.value = Drawing(
                points: [offset],
                color: selectedrawingType.value == DrawingType.eraser
                    ? Colors.white
                    : strokeColor.value,
                size: strokeWidth.value.toDouble(),
                type: selectedrawingType.value,
              );
            },
            onPointerUp: (details) {
              allDrawings.value = List.from(allDrawings.value)
                ..add(activeDarwing.value!);
            },
            child: RepaintBoundary(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                child: CustomPaint(
                  painter: CustomDrawer(
                    drawings: activeDarwing.value == null
                        ? []
                        : [activeDarwing.value!],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 10,
            left: 10,
            child: SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
                      .animate(animationController),
              child: DrawingPallette(
                  strokeColor: strokeColor,
                  selectedrawingType: selectedrawingType),
            ),
          )
        ],
      ),
    );
  }
}
