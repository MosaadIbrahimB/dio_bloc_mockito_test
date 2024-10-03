import 'package:equatable/equatable.dart';

abstract class QuoteState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialQuoteState extends QuoteState {}

class LoadingQuoteState extends QuoteState {}

class LoadedQuoteState extends QuoteState {
  final String quote;
  final String author;
  LoadedQuoteState(this.quote, this.author);
}

class ErrorQuoteState extends QuoteState {
  final String message;
  ErrorQuoteState(this.message);
}
