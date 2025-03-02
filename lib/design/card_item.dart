import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    required this.label,
    required this.urlImage,
    required this.onTap,
    super.key,
  });

  final String label;
  final String urlImage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 200,
        color: Colors.brown.withValues(),
        padding: EdgeInsets.all(8.0),
        child: Column(
          spacing: 12.0,
          children: [Image.network(urlImage), Text(label)],
        ),
      ),
    );
  }
}
