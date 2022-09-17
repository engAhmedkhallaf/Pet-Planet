// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pet_planet/data/models/category_model.dart';
import 'package:pet_planet/data/repositories/category/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({
    required CategoryRepository categoryRepository,
  })  : _categoryRepository = categoryRepository,
        super(CategoryLoadingState()) {
    on<StartCategoriesEvent>(_onLoadingCategories);
    on<UpdateCategoriesEvent>(_onUpdateCategories);
  }

  FutureOr<void> _onLoadingCategories(
      StartCategoriesEvent event, Emitter<CategoryState> emit) async {
    _categorySubscription?.cancel();
    _categorySubscription = _categoryRepository.getAllCategories().listen(
          (categories) => add(
            UpdateCategoriesEvent(categories),
          ),
        );
  }

  FutureOr<void> _onUpdateCategories(
      UpdateCategoriesEvent event, Emitter<CategoryState> emit) async {
    emit(CategorySuccessState(categories: event.categories));
  }
}
