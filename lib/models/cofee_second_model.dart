
class CofeeSecond {

  String _title;
  String _subtitle;
  String _imgUrl;
  String _price;

  CofeeSecond(this._title, this._subtitle, this._imgUrl, this._price);

  String get price => _price;

  String get imgUrl => _imgUrl;

  String get subtitle => _subtitle;

  String get title => _title;
}