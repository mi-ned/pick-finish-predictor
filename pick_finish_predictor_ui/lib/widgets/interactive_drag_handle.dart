import 'package:flutter/material.dart';

class InteractiveDragHandle extends StatelessWidget {
  final VoidCallback onDismiss;
  final double width;
  final double height;
  final Color color;

  const InteractiveDragHandle({
    super.key,
    required this.onDismiss,
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onDismiss,
      onVerticalDragUpdate: (details) {
        // Triggers dismiss when user drags up or down on the handle
        if (details.primaryDelta != null && details.primaryDelta!.abs() > 2) {
          onDismiss();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Center(
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),
        ),
      ),
    );
  }
}