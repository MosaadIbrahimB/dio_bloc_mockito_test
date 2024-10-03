import 'package:dio/dio.dart';
import 'package:untitled14/logic/quote_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled14/network/api.dart';

class QuoteCubit extends Cubit<QuoteState> {
  final ApiService _apiService;

  QuoteCubit(this._apiService) : super(InitialQuoteState());

  Future<void> emitStates() async {
    emit(LoadingQuoteState());
    try {
      final data = await _apiService.fetchQuote();
      emit(LoadedQuoteState(data.quote, data.author));
    } catch (e) {
      emit(ErrorQuoteState(e.toString()));
    }
  }
}
