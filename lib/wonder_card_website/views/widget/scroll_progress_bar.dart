import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScrollProgressBar extends StatefulWidget {
  final ItemPositionsListener positionsListener;

  const ScrollProgressBar({super.key, required this.positionsListener});

  @override
  State<ScrollProgressBar> createState() => _ScrollProgressBarState();
}

class _ScrollProgressBarState extends State<ScrollProgressBar> {
  double progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4,
      child: LinearProgressIndicator(
        value: progress,
        backgroundColor: Colors.transparent,
        color: Colors.deepPurpleAccent,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.positionsListener.itemPositions.addListener(() {
      if (mounted) {
        setState(() {
          final positions = widget.positionsListener.itemPositions.value;
          if (positions.isNotEmpty) {
            final firstItem = positions.first;
            progress = firstItem.itemLeadingEdge.clamp(0.0, 1.0);
          } else {
            progress = 0.0;
          }
        });
      }
    });
  }
}
