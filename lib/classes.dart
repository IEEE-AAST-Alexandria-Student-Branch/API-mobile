import 'dart:convert';

Quote quoteFromJson(String str) => Quote.fromJson(json.decode(str));

class Quote {
  final String content;
  final String author;
  final String authorSlug;

  Quote({
    required this.content,
    required this.author,
    required this.authorSlug,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
    content: json["content"],
    author: json["author"],
    authorSlug: json["authorSlug"],
  );
}
