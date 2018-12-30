import 'package:flutter/material.dart';

import 'package:drinkees/src/models/drink.dart';

Widget DrinkInfo(Drink drink) {
  print("a;sjghak;sdhgn;asvkhfliau naiuhglaksjdhfkuashdnfl kuhadf   " +
      drink.strDrinkThumb);
  return Container(
    child: Scaffold(
      body: Column(
        children: <Widget>[
          Image.network(
            drink.strDrinkThumb,
            fit: BoxFit.fill,
          ),
          Text(drink.strDrink),
          Text(drink.strInstructions),
        ],
      ),
    ),
  );
}
