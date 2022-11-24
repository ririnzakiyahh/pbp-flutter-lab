import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/page/mywatchlist.dart';

class MyWatchListData extends StatefulWidget {
  final int index;
  final MyWatchList movie;

  const MyWatchListData({super.key, required this.index, required this.movie});

  @override
  State<MyWatchListData> createState() => _MyWatchListDataState();
}

class _MyWatchListDataState extends State<MyWatchListData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      drawer: drawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: 800,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.movie.fields.movieTitle,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      // Release Date
                      const TextSpan(
                          text: '\nRelease Date: ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: '${widget.movie.fields.releaseDate}\n',
                          style: const TextStyle(
                              fontSize: 20)),
                      // Rating
                      const TextSpan(
                          text: '\nRating: ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: '${widget.movie.fields.movieRate}/5\n',
                          style: const TextStyle(
                              fontSize: 20)),
                      // Watched
                      const TextSpan(
                          text: '\nStatus: ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      TextSpan(
                          style: TextStyle(fontSize: 20),
                          text: (checkStatus(widget.movie.fields.watchedMovie))),
                      // Review
                      const TextSpan(
                          text: '\nReview: \n',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: '${widget.movie.fields.movieReview}\n',
                          style: const TextStyle(
                              fontSize: 20)),
                    ],
                  ),
                ),
              ],
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                padding: const EdgeInsets.only(top: 10.0),
                // Button Back
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyWatchlistPage()),
                      );
                    },
                    child: const SizedBox(
                        height: 30,
                        width: 900,
                        child: Center(
                          child: Text(
                            "Back",
                            style: TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ))),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  String checkStatus(String status) {
    if (status == WatchedMovie.BELUM) {
      return "Belum";
    } else {
      return "Sudah";
    }
  }
}