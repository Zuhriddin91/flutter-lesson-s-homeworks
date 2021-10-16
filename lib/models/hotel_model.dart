
class Hotel {
  String _hotelName;
  String _hotelRate;
  int _cost;
  String _imageUrl;

  Hotel(this._hotelName, this._hotelRate, this._cost, this._imageUrl);

  String get imageUrl => _imageUrl;

  int get cost => _cost;

  String get hotelRate => _hotelRate;

  String get hotelName => _hotelName;
}