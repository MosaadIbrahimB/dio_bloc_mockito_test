import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled14/logic/quote_cubit.dart';
import 'package:untitled14/model/QuoteResponse.dart';
import 'package:untitled14/network/api.dart';

import 'api_service_moc.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late ApiService apiService;

  group('Test Api Services', () {
    setUp(() {
      mockDio = MockDio();
      apiService = ApiService(mockDio);
    });

    test('fetch quote successfully', () async {
      final mocResponse = {'content': 'Hello', 'author': 'World'};
      when(mockDio.get('http://api.quotable.io/random'))
          .thenAnswer((_) async => Response(
              data: mocResponse,
              requestOptions: RequestOptions(
                path: '',
              ),
              statusCode: 200));
      final result = await apiService.fetchQuote();
      expect(result, isA<QuoteResponse>());
    });
    test('fetch quote failed', () async {
      when(mockDio.get('http://api.quotable.io/random')).thenThrow(
        DioException(
            requestOptions: RequestOptions(path: ''),
            error: 'Failed to fetch',
            type: DioExceptionType.badResponse),
      );

      ApiService apiService = ApiService(mockDio);
      expect(() async => await apiService.fetchQuote(), throwsException);
    });
  });
}
