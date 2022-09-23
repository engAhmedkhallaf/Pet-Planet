import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_planet/data/models/product_model.dart';
import 'package:pet_planet/data/repositories/product/product_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;
  SearchBloc({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(SearchLoadingState()) {
    on<LoadSearchEvent>(_onLoadSearch);
    on<SearchProductEvent>(_onSearchProduct);
    on<UpdateResultsEvent>(_onUpdateResults);
  }

  late List<Product> _products;

  FutureOr<void> _onLoadSearch(
      LoadSearchEvent event, Emitter<SearchState> emit) {
    _productSubscription?.cancel();
    _productSubscription =
        _productRepository.getAllProducts().listen((products) {
      add(
        UpdateResultsEvent(products),
      );
      _products = products;
    });
    emit(const SearchLoadedState());
  }

  FutureOr<void> _onSearchProduct(
      SearchProductEvent event, Emitter<SearchState> emit) {
    if (event.productName.isNotEmpty) {
      List<Product> seachResults = _products
          .where((product) => product.name
              .toLowerCase()
              .startsWith(event.productName.toLowerCase()))
          .toList();
      emit(SearchLoadedState(products: seachResults));
    } else {
      emit(const SearchLoadedState());
    }
  }

  FutureOr<void> _onUpdateResults(
      UpdateResultsEvent event, Emitter<SearchState> emit) {}

  @override
  Future<void> close() async {
    _productSubscription?.cancel();
    super.close();
  }
}
