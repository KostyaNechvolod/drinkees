import 'package:flutter/material.dart';
import 'package:drinkees/src/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:drinkees/src/widgets/drink_info.dart';

class CoctailInfoScreen extends StatefulWidget {
  final String drinkId;

  CoctailInfoScreen(@required this.drinkId);

  @override
  _CoctailInfoScreenState createState() => _CoctailInfoScreenState(drinkId);
}

class _CoctailInfoScreenState extends State<CoctailInfoScreen> {
  final String drinkId;
  final DrinkBloc _drinkBloc = DrinkBloc();

  _CoctailInfoScreenState(this.drinkId) {
    _drinkBloc.dispatch(Fetch2(drinkId));
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
              child: Text('failed to fetch Coctails'),
            );
          }
          if (state.drinks.isEmpty) {
            return Center(
              child: Text('no Coctails'),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(state.drinks[0].strDrink),
            ),
            body: DrinkInfo(state.drinks[0]),
          );
        });
  }
}

//DrinkInfo(state.drinks[0]);
