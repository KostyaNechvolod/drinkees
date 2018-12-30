import 'package:flutter/material.dart';
import 'package:drinkees/src/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drinkees/src/models/models.dart';

class RandomDrinkPage extends StatefulWidget {
  @override
  _RandomDrinkPageState createState() => _RandomDrinkPageState();
}

class _RandomDrinkPageState extends State<RandomDrinkPage> {
  final _scrollController = ScrollController();
  final DrinkBloc _drinkBloc = DrinkBloc();
  final _scrollThreshold = 200.0;

  _RandomDrinkPageState() {
    _scrollController.addListener(_onScroll);
    _drinkBloc.dispatch(Fetch1());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _drinkBloc,
      builder: (BuildContext context, DrinkState state) {
        if (state.isInitializing) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.isError) {
          return Center(
            child: Text('failed to fetch Drinks'),
          );
        }
        if (state.drinks.isEmpty) {
          return Center(
            child: Text('no Drinks'),
          );
        }

        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return index >= state.drinks.length
                ? _bottomLoader()
                : _postWidget(state.drinks[index]);
          },
          itemCount:
          state.hasReachedMax ? state.drinks.length : state.drinks.length + 1,
          controller: _scrollController,
        );
      },
    );
  }

  @override
  void dispose() {
    _drinkBloc.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _drinkBloc.dispatch(Fetch1());
    }
  }

  Widget _postWidget(Drink post) => ListTile(
    leading: SizedBox(
      width: 50.0,
      height: 50.0,
      child: Image.network(
        post.strDrinkThumb,
        fit: BoxFit.contain,),
    ),
    title: Text('${post.strDrink}'),
    isThreeLine: true,
    subtitle: Text(post.idDrink),
    dense: true,
  );

  Widget _bottomLoader() => Container(
    alignment: Alignment.center,
    child: Center(
      child: SizedBox(
        width: 33,
        height: 33,
        child: CircularProgressIndicator(
          strokeWidth: 1.5,
        ),
      ),
    ),
  );
}
