
class NewsModel {
  final String author;
  final String title;
  final String description;
  final String url;
  final String source;
  final String image;
  final String category;
  final String language;
  final String country;
  final String publishedAt;

  NewsModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.source,
    required this.image,
    required this.category,
    required this.language,
    required this.country,
    required this.publishedAt,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      author: json['author'] ?? 'No author',
      title: json['title'] ?? 'No title',
      description: json['description'] ?? 'No description',
      url: json['url'] ?? 'No url',
      source: json['source'] ?? 'No source',
      image: json['image'] ?? '',
      category: json['category'] ?? '',
      language: json['language'] ?? '',
      country: json['country'] ?? '',
      publishedAt: json['published_at'] ?? '',);
  }

}
