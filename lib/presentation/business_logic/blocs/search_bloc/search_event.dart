part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class LoadSearchEvent extends SearchEvent {}

class SearchProductEvent extends SearchEvent {
  final String productName;

  const SearchProductEvent({required this.productName});

  @override
  List<Object> get props => [productName];
}

class UpdateResultsEvent extends SearchEvent {
  final List<Product> products;

  const UpdateResultsEvent(this.products);

  @override
  List<Object> get props => [products];
}
