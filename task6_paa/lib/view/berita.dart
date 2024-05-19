import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6_paa/model/berita.dart';
import 'package:task6_paa/provider/berita_provider.dart';
import 'package:task6_paa/view/detail_berita.dart';

class BeritaPage extends StatelessWidget {
  const BeritaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BeritaProvider()..fetchData(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent, // Set the AppBar color to grey
          title: Center(
            child: Text(
              'Sport For YOU',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Consumer<BeritaProvider>(
          builder: (context, provider, _) {
            if (provider.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (provider.berita.isEmpty) {
              return Center(child: Text('No data available'));
            }
            return ListView.builder(
              itemCount: provider.berita.length,
              itemBuilder: (context, index) {
                final berita = provider.berita[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  child: Card(
                    elevation: 2,
                    color: Colors.blue, // Set the card color to blue
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(berita: berita),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          SizedBox(width: 15,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              berita.thumbnail,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    berita.title,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white, // Set text color to white for better visibility
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    berita.pubDate,
                                    style: TextStyle(
                                      color: Colors.white70, // Set text color to a lighter shade for contrast
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    berita.description,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white60, // Set text color to a lighter shade for contrast
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
