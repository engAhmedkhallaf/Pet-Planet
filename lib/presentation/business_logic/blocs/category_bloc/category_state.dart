part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryLoadingState extends CategoryState {}

class CategorySuccessState extends CategoryState {
  final List<Category> categories;

 const CategorySuccessState({this.categories = const <Category>[]});

  @override
  List<Object> get props => [categories,];
}

class CategoryFailureState extends CategoryState {}
