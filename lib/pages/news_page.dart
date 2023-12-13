import 'package:flutter/material.dart';
import 'package:news_application/models/news_model.dart';
import 'package:news_application/network/network_request.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final NetworkRequest networkRequest = NetworkRequest();
  late Future<List<NewsModel>> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = networkRequest.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: futureNews,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              return GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final NewsModel news = snapshot.data[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Image.network(news.image,
                            width: MediaQuery.of(context).size.width,
                            height: 80,
                            //fit: BoxFit.cover,
                            errorBuilder:
                                (BuildContext context, Object exception,
                                    StackTrace? stackTrace) {
                          return Image.asset(
                            'assets/images/no_image.jpg',
                            width: MediaQuery.of(context).size.width,
                            height: 80,
                          );
                        }),
                        ListTile(
                          title: SizedBox(
                            height: 50,
                            child: ListView(
                              children: [
                                Text(news.title, style: TextStyle(
                                fontSize: 12, fontStyle: FontStyle.italic,
                              ),),
                            ]
                          ),),
                          subtitle: Text('Category: ${news.category}', style: TextStyle(
                            fontSize: 10,
                          ),),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
