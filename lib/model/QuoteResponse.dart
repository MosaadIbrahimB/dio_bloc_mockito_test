class QuoteResponse {
  String quote;
  String author;

  QuoteResponse({required this.quote, required this.author});

  factory QuoteResponse.fromJson(Map<String, dynamic> json) {
    return QuoteResponse(quote: json['content'], author: json['author']);
  }
}
