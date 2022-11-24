import 'package:counter_7/page/mywatchlist_data.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/page/drawer.dart';

import 'package:counter_7/data/data.dart';

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({Key? key}) : super(key: key);

  @override
  State<MyWatchlistPage> createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage>{
  late Future<List<MyWatchList>> myWatchList;

  @override
  void initState() {
    super.initState();
    myWatchList = fetchMyWatchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
        // Drawer navbar
        drawer: drawer(),
        body: FutureBuilder(
            future: myWatchList,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada MyWatchList :(",
                        style:
                        TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemBuilder: (_, index) => GestureDetector(
                        onTap: () {
                          // Navigasi dari setiap judul watch list ke halaman detail
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyWatchListData(
                            index: index,
                            movie: snapshot.data![index],
                          )));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          padding: const EdgeInsets.all(20.0),
                          // Menambahkan warna untuk outline pada setiap mywatchlist pada halaman mywatchlist berdasarkan status ditonton
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3.5,
                                  color: ((snapshot.data![index].fields.watchedMovie == "Sudah")
                                      ? Colors.blue
                                      : Colors.deepPurpleAccent)
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey, blurRadius: 0.5)
                              ]),
                          child:
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "${snapshot.data![index].fields.movieTitle}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                }
              }
            }));
  }

}