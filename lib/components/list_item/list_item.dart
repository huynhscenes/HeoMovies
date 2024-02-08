import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final int index;

  ListItem({required this.index});

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        width: _isHovered ? 325 : 225,
        height: _isHovered ? 300 : 120,
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                      color: Colors.white.withOpacity(0.07), blurRadius: 15)
                ]
              : [],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  "https://occ-0-1723-92.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABU7D36jL6KiLG1xI8Xg_cZK-hYQj1L8yRxbQuB0rcLCnAk8AhEK5EM83QI71bRHUm0qOYxonD88gaThgDaPu7NuUfRg.jpg?r=4ee",
                  fit: BoxFit.cover,
                ),
              ),
              if (_isHovered)
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.play_arrow, color: Colors.white),
                        Icon(Icons.add, color: Colors.white),
                        Icon(Icons.thumb_up, color: Colors.white),
                        Icon(Icons.thumb_down, color: Colors.white),
                      ],
                    ),
                    Row(
                      children: [
                        Text("1 hour 14 mins",
                            style: TextStyle(color: Colors.grey)),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child:
                              Text("+16", style: TextStyle(color: Colors.grey)),
                        ),
                        Text("1999", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Text(
                      "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Praesentium hic rem eveniet error possimus, neque ex doloribus.",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    Text(
                      "Action",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
