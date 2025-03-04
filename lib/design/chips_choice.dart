import 'package:flutter/material.dart';

class ChipsChoice extends StatefulWidget {
  const ChipsChoice({
    required this.leading,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final bool selected;
  final Function(bool) onTap;
  final Widget leading;

  @override
  State<ChipsChoice> createState() => _ChipsChoiceState();
}

class _ChipsChoiceState extends State<ChipsChoice> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(!widget.selected),
      child: Container(
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: widget.selected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          children: [widget.leading, Icon(Icons.arrow_drop_down, size: 24)],
        ),
      ),
    );
  }
}
