import 'package:dio/dio.dart';
import 'package:untitled14/model/QuoteResponse.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<QuoteResponse> fetchQuote() async {
    try {
      final response = await _dio.get('http://api.quotable.io/random');
      print('Response: $response');
      return QuoteResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch');
    }
  }
}
