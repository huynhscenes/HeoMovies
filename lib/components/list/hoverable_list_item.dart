import 'package:flutter/material.dart';

class HoverableListItem extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;

  HoverableListItem({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  _HoverableListItemState createState() => _HoverableListItemState();
}

class _HoverableListItemState extends State<HoverableListItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            widget.imageUrl,
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
          if (_isHovered)
            Positioned(
              child: Material(
                color: Colors.transparent,
                child: Image.network(
                  widget.imageUrl,
                  width: 500,
                  height: 500,
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
