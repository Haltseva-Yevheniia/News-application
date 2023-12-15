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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Image.network(news.image,
                  width: MediaQuery.of(context).size.width,
                  //height: 200,
                  fit: BoxFit.cover, errorBuilder: (
                BuildContext context,
                Object exception,
                StackTrace? stackTrace,
              ) {
                return Image.asset(
                  'assets/images/no_image.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                );
              }),
              const SizedBox(height: 10),
              Text(
                news.title,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                news.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Published: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(news.publishedAt))}',
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'You can find more details at:',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
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
