part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialState extends HomeEvent {}

class AddWishlist extends HomeEvent {}

class AddCart extends HomeEvent {}

class NavigateToWishlist extends HomeEvent {}

class NavigateToCart extends HomeEvent {}
