import 'package:flutter/material.dart';
import 'package:heomovie/components/list_item/list_item.dart';

class List extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {
  late ScrollController _scrollController;
  double _scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollPosition = _scrollController.position.pixels;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Text(
            "Continue to watch",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 10),
        Stack(
          children: [
            SizedBox(
              height: 120, // Đặt chiều cao cụ thể cho ListView.builder
              child: ListView.builder(
                shrinkWrap: true,
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListItem(index: index);
                },
              ),
            ),
            if (_scrollPosition > 0)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    _scrollController.animateTo(
                      _scrollPosition - 230,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                onPressed: () {
                  _scrollController.animateTo(
                    _scrollPosition + 230,
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
