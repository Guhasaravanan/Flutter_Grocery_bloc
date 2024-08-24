import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/feature/cart/ui/cart.dart';
import 'package:my_flutter_app/feature/wishlist/ui/wishlist.dart';

import '../bloc/home_bloc.dart'; // Ensure this is present

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeBloc.add(HomeInitialState());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is NavigateToCart) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is NavigateToWishlist) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wishlist()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text('Grocery'),
            actions: [
              IconButton(
                  onPressed: () {
                    homeBloc.add(NavigateToWishlist());
                  },
                  icon: Icon(Icons.favorite_border)),
              IconButton(
                  onPressed: () {
                    homeBloc.add(NavigateToCart());
                  },
                  icon: Icon(Icons.shopping_bag_outlined))
            ],
          ),
        );
      },
    );
  }
}
