import 'package:flutter/material.dart';
import 'package:drinkees/src/models/coctail.dart';
import 'package:drinkees/src/pages/coctail_info_screen.dart';


Widget CoctailCard(BuildContext context, Coctail coctail){
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CoctailInfoScreen(coctail.idDrink),
        ),
      );
    },
    child: Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
              aspectRatio: 18.0/12.0,
              child: Image.network(
                coctail.strDrinkThumb,
                fit: BoxFit.fitWidth,

              ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(coctail.strDrink)
              ],
            ),
          )
        ],
      ),
    ),
  );
}
