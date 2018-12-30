import 'package:json_annotation/json_annotation.dart';

part 'drink.g.dart';

@JsonSerializable()
class Drink {
  final String idDrink;
  final String strDrink;
  final String strDrinkES;
  final String strDrinkDE;
  final String strDrinkFR;
  @JsonKey(name: 'strDrinkZH-HANS')
  final String strDrinkZH_HANS;
  @JsonKey(name: 'strDrinkZH-HANT')
  final String strDrinkZH_HANT;
  final String strVideo;
  final String strCategoryCoffee;
  final String strIBA;
  final String strAlcoholic;
  final String strGlass;
  final String strInstructions;
  final String strInstructionsES;
  final String strInstructionsDE;
  final String strInstructionsFR;
  @JsonKey(name: 'strInstructionsZH-HANS')
  final String strInstructionsZH_HANS;
  @JsonKey(name: 'strInstructionsZH-HANT')
  final String strInstructionsZH_HANT;
  final String strDrinkThumb;
  final String strIngredient1;
  final String strIngredient2;
  final String strIngredient3;
  final String strIngredient4;
  final String strIngredient5;
  final String strIngredient6;
  final String strIngredient7;
  final String strIngredient8;
  final String strIngredient9;
  final String strIngredient10;
  final String strIngredient11;
  final String strIngredient12;
  final String strIngredient13;
  final String strIngredient14;
  final String strIngredient15;
  final String strMeasure1;
  final String strMeasure2;
  final String strMeasure3;
  final String strMeasure4;
  final String strMeasure5;
  final String strMeasure6;
  final String strMeasure7;
  final String strMeasure8;
  final String strMeasure9;
  final String strMeasure10;
  final String strMeasure11;
  final String strMeasure12;
  final String strMeasure13;
  final String strMeasure14;
  final String strMeasure15;
  final String dateModified;

  Drink(this.idDrink, this.strDrink, this.strDrinkES, this.strDrinkDE,
      this.strDrinkFR, this.strDrinkZH_HANS, this.strDrinkZH_HANT,
      this.strVideo, this.strCategoryCoffee, this.strIBA, this.strAlcoholic,
      this.strGlass, this.strInstructions, this.strInstructionsES,
      this.strInstructionsDE, this.strInstructionsFR,
      this.strInstructionsZH_HANS, this.strInstructionsZH_HANT,
      this.strDrinkThumb, this.strIngredient1, this.strIngredient2,
      this.strIngredient3, this.strIngredient4, this.strIngredient5,
      this.strIngredient6, this.strIngredient7, this.strIngredient8,
      this.strIngredient9, this.strIngredient10, this.strIngredient11,
      this.strIngredient12, this.strIngredient13, this.strIngredient14,
      this.strIngredient15, this.strMeasure1, this.strMeasure2,
      this.strMeasure3, this.strMeasure4, this.strMeasure5, this.strMeasure6,
      this.strMeasure7, this.strMeasure8, this.strMeasure9, this.strMeasure10,
      this.strMeasure11, this.strMeasure12, this.strMeasure13,
      this.strMeasure14, this.strMeasure15, this.dateModified);

  factory Drink.fromJson(Map<String, dynamic> json) => _$DrinkFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkToJson(this);




}