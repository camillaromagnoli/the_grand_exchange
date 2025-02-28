import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({required this.label, required this.urlImage, super.key});

  final String label;
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown.withValues(),
      padding: EdgeInsets.all(8.0),
      child: Column(
        spacing: 12.0,
        children: [Image.network(urlImage), Text(label)],
      ),
    );
  }
}
