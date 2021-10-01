

class DeliveryFood{

  String _name;
  String _desciption;
  String _imageUrl;
  double _price;

  DeliveryFood(this._name, this._desciption, this._price, this._imageUrl);

  double get price => _price;

  String get desciption => _desciption;

  String get name => _name;

  String get imageUrl => _imageUrl;
}