import 'dart:convert';
import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:drinkees/src/bloc/bloc.dart';
import 'package:drinkees/src/models/models.dart';

class DrinkBloc extends Bloc<DrinkEvent, DrinkState> {
  @override
  Stream<DrinkEvent> transform(Stream<DrinkEvent> events) {
    return (events as Observable<DrinkEvent>)
        .debounce(Duration(milliseconds: 500));
  }

  @override
  get initialState => DrinkState.initial();

  @override
  Stream<DrinkState> mapEventToState(currentState, event) async* {
    if (event is Fetch1) {
      try {
        final drinks = await _fetchDrinks();
        if (drinks.isEmpty) {
          yield currentState.copyWith(hasReachedMax: true);
        } else {
          yield DrinkState.success(currentState.drinks + drinks);
        }
      } catch (_) {
        yield DrinkState.failure();
      }
    }
  }

  Future<List<Drink>> _fetchDrinks() async {
    String latestProductsUrl =
        'https://www.thecocktaildb.com/api/json/v1/1/random.php';
    http.Response response = await http.get(latestProductsUrl);
    List popularProductsJson = json.decode(response.body)['drinks'];
    List<Drink> products = List();
    popularProductsJson.forEach((json) => products.add(Drink.fromJson(json)));

    print("drinks = $products");
    return products;
  }
}
