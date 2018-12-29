class Coctail {
  final String strDrink;
  final String strDrinkThumb;
  final String idDrink;

  Coctail(this.strDrink, this.strDrinkThumb, this.idDrink);

  Coctail.fromJSON(Map<String, dynamic> json)
      : strDrink = json['strDrink'],
        strDrinkThumb = json['strDrinkThumb'],
        idDrink = json['idDrink'];

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) || this.idDrink == other.idDrink;

  @override
  int get hashCode => int.parse(idDrink);
}
