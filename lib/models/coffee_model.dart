class Coffee {

  String _nomi;
  String _tarkib;
  String _izox;
  String _rasmUrl;
  double _narx;
  double _rating;

  Coffee(
      this._nomi,
      this._tarkib,
      this._izox,
      this._rasmUrl,
      this._narx,
      this._rating
      );

  double get narx => _narx;
  String get rasmUrl =>_rasmUrl;
  String get izox => _izox;
  String get nomi => _nomi;
  double get rating => _rating;
  String get tarkib => _tarkib;
}