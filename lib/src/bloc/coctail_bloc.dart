import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:drinkees/src/bloc/bloc.dart';
import 'package:drinkees/src/models/models.dart';

class CoctailBloc extends Bloc<CoctailEvent, CoctailState> {
  @override
  Stream<CoctailEvent> transform(Stream<CoctailEvent> events) {
    return (events as Observable<CoctailEvent>)
        .debounce(Duration(milliseconds: 500));
  }

  @override
  get initialState => CoctailState.initial();

  @override
  Stream<CoctailState> mapEventToState(currentState, event) async* {
    if (event is Fetch) {
      try {
        final Coctails = await _fetchCoctails();
        if (Coctails.isEmpty) {
          yield currentState.copyWith(hasReachedMax: true);
        } else {
          yield CoctailState.success(currentState.coctails + Coctails);
        }
      } catch (_) {
        yield CoctailState.failure();
      }
    }
  }

  Future<List<Coctail>> _fetchCoctails() async {
    String latestProductsUrl =
        'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail';
    http.Response response = await http.get(latestProductsUrl);
    List popularProductsJson = json.decode(response.body)['drinks'];
    List<Coctail> products = List();
    popularProductsJson.forEach((json) => products.add(Coctail.fromJSON(json)));

    print("products = $products");
    return products;
  }
}
