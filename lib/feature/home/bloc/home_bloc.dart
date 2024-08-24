import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_flutter_app/data/grocery_data.dart';
import 'package:my_flutter_app/feature/home/model/home_product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialState>(homeInitialState);
    on<AddWishlist>(addWishlist);
    on<AddCart>(addCart);
    on<NavigateToWishlist>(navigateToWishlist);
    on<NavigateToCart>(navigateToCart);
  }

  FutureOr<void> homeInitialState(
      HomeInitialState event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeSuccessState(
        products: GroceryData.groceries.map((e) => ProductDataModel(
            id: e['id'],
            name: e['name'],
            descrption: e['descrption'],
            price: e['price'],
            imageurl: e['imageurl'])).toList()));
  }

  FutureOr<void> addWishlist(AddWishlist event, Emitter<HomeState> emit) {}

  FutureOr<void> addCart(AddCart event, Emitter<HomeState> emit) {}

  FutureOr<void> navigateToWishlist(
      NavigateToWishlist event, Emitter<HomeState> emit) {
    emit(HomeNavigateWishlist());
  }

  FutureOr<void> navigateToCart(NavigateToCart event, Emitter<HomeState> emit) {
    emit(HomeNavigateCart());
  }
}
