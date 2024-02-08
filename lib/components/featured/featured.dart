import 'package:flutter/material.dart';

class Featured extends StatelessWidget {
  final String type;

  Featured({required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Stack(
        children: [
          Image.network(
            "https://images.pexels.com/photos/6899260/pexels-photo-6899260.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          if (type.isNotEmpty)
            Positioned(
              top: 80,
              left: 50,
              child: Row(
                children: [
                  Text(
                    type == "movie" ? "Movies" : "Series",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  SizedBox(width: 20),
                  DropdownButton<String>(
                    items: <String>[
                      'Adventure',
                      'Comedy',
                      'Crime',
                      'Fantasy',
                      'Historical',
                      'Horror',
                      'Romance',
                      'Sci-fi',
                      'Thriller',
                      'Western',
                      'Animation',
                      'Drama',
                      'Documentary'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                    hint: Text("Genre", style: TextStyle(color: Colors.white)),
                    dropdownColor: Colors.black,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          Positioned(
            left: 50,
            bottom: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  "https://occ-0-1432-1433.1.nflxso.net/dnm/api/v6/LmEnxtiAuzezXBjYXPuDgfZ4zZQ/AAAABUZdeG1DrMstq-YKHZ-dA-cx2uQN_YbCYx7RABDk0y7F8ZK6nzgCz4bp5qJVgMizPbVpIvXrd4xMBQAuNe0xmuW2WjoeGMDn1cFO.webp?r=df1",
                  width: 400,
                ),
                SizedBox(height: 20),
                Text(
                  "Lorem ipsum dolor sit amet consectetur adipisicing elit. Vitae adipisci repellendus eum quasi illo, velit numquam, maxime tempora sint deleniti, aliquid qui? Facilis, adipisci! Ratione hic repudiandae temporibus eum earum?",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.play_arrow),
                      label: Text("Play"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.info_outline),
                      label: Text("Info"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                        onPrimary: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
