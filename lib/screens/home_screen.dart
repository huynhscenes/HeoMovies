import 'package:flutter/material.dart';
import 'package:heomovie/api/api.dart';
import 'package:heomovie/components/featured/featured.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TMDB api = TMDB();
  Future<List<Map<String, dynamic>>>? trendingMoviesWeek;
  Future<List<Map<String, dynamic>>>? trendingMoviesToday;
  Future<List<Map<String, dynamic>>>? trendingTVWeek;
  Future<List<Map<String, dynamic>>>? trendingTVToday;

  @override
  void initState() {
    super.initState();
    trendingMoviesWeek = api.getTrending(type: 'movie', time: 'week');
    trendingMoviesToday = api.getTrending(type: 'movie', time: 'day');
    trendingTVWeek = api.getTrending(type: 'tv', time: 'week');
    trendingTVToday = api.getTrending(type: 'tv', time: 'day');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          "heo_logo.png",
          height: 50,
          width: 50,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.pexels.com/photos/6899260/pexels-photo-6899260.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
            radius: 15,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Featured(type: "series"),
            buildList(trendingTVWeek, "Trending TV Shows This Week"),
            buildList(trendingTVToday, "Trending TV Shows Today"),
            buildList(trendingMoviesWeek, "Trending Movies This Week"),
            buildList(trendingMoviesToday, "Trending Movies Today"),
          ],
        ),
      ),
    );
  }

  Widget buildList(Future<List<Map<String, dynamic>>>? future, String title) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var itemWidth = constraints.maxWidth * 0.6;
        var itemHeight = constraints.maxHeight * 0.4;

        return FutureBuilder<List<Map<String, dynamic>>>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: itemHeight,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var movie = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () => _showVideoPopup(context, movie),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
                              width: itemWidth,
                              height: itemHeight,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }

  void _showVideoPopup(BuildContext context, Map<String, dynamic> movie) {
    var popupWidth = MediaQuery.of(context).size.width * 0.8;
    var popupHeight = MediaQuery.of(context).size.height * 0.6;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
                width: popupWidth,
                height: popupHeight * 0.7, // 70% của chiều cao popup
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                movie['title'] ?? movie['name'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                movie['overview'],
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.play_arrow),
                    label: Text('Play'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.thumb_up),
                    label: Text('Like'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.thumb_down),
                    label: Text('Dislike'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    label: Text('Add'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
