import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:untitled14/logic/quote_cubit.dart';
import 'package:untitled14/logic/quote_state.dart';
import 'package:untitled14/model/QuoteResponse.dart';
import 'package:untitled14/network/api.dart';
import 'api_service_moc.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late ApiService apiService;
  late QuoteCubit quoteCubit;
  group(
    'Test quote cubit',
    () {
      final QuoteResponse quoteResponse =
          QuoteResponse(quote: 'Hello', author: 'World');
      setUp(
        () {
          mockDio = MockDio();
          apiService = ApiService(mockDio);
          quoteCubit = QuoteCubit(apiService);
        },
      );

      blocTest<QuoteCubit, QuoteState>(
        'emit quote loading and loaded cubit state',
        build: () {
          when(mockDio.get('http://api.quotable.io/random')).thenAnswer(
            (_) async => Response(
              data: {'content': 'Hello', 'author': 'World'},
              requestOptions: RequestOptions(path: ''),
              statusCode: 200,
            ),
          );
          return quoteCubit;
        },
        act: (cubit) async => await cubit.emitStates(),
        expect: () => [
          LoadingQuoteState(),
          LoadedQuoteState(quoteResponse.quote, quoteResponse.author),
        ],
      );

      blocTest<QuoteCubit, QuoteState>(
        'emit quote failure cubit state',
        build: () {
          when(mockDio.get('http://api.quotable.io/random'))
              .thenThrow(DioException(
            requestOptions: RequestOptions(path: ''),
            error: 'Failed to fetch',
            type: DioExceptionType.badResponse,
          ));
          return quoteCubit;
        },
        act: (cubit) async => await cubit.emitStates(),
        expect: () => [
          LoadingQuoteState(),
          ErrorQuoteState('Failed to fetch'),
        ],
      );
    },
  );
}
