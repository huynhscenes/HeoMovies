import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool isScrolled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: isScrolled ? Colors.black : Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "heo_logo.png",
            height: 70,
          ),
          Expanded(
            child: SizedBox(
              height: 50, // Đặt chiều cao mong muốn ở đây
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 20),
                  Text("Homepage"),
                  SizedBox(width: 10),
                  Text("Series"),
                  SizedBox(width: 10),
                  Text("Movies"),
                  SizedBox(width: 10),
                  Text("New and Popular"),
                  SizedBox(width: 10),
                  Text("My List"),
                  SizedBox(width: 10),
                  Icon(Icons.search),
                  SizedBox(width: 10),
                  Text("KID"),
                  SizedBox(width: 10),
                  Icon(Icons.notifications),
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/6899260/pexels-photo-6899260.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
                    radius: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollListener();
  }

  _scrollListener() {
    // Add scroll listener to check if user has scrolled
  }
}
