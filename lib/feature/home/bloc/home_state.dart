part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<ProductDataModel> products;

  HomeSuccessState({required this.products});
  
}

class HomeErrorState extends HomeState {}

class HomeNavigateWishlist extends HomeActionState {}

class HomeNavigateCart extends HomeActionState {}
