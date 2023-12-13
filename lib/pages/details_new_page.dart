import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_application/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailNewPage extends StatelessWidget {
  final NewsModel news;
  const DetailNewPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('News')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(news.image,
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  fit: BoxFit.cover, errorBuilder: (BuildContext context,
                      Object exception, StackTrace? stackTrace) {
                return const SizedBox(
                  width: 150,
                  height: 150,
                );
              }),
              const SizedBox(height: 10),
              Text(
                news.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                news.description,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                DateFormat('dd/MM/yyyy').format(
                  DateTime.parse(news.publishedAt),
                ),
              ),
              TextButton(
                onPressed: () => clickUrl(news.url),
                child: Text(
                  news.url,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clickUrl(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri);
  }
}
