import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({
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
    return ListTile(
      onTap: onTap,
      leading: Image.network(urlImage),
      title: Text(label),
      trailing: Text('900'),
    );
  }
}
