import 'dart:ui';

class SportType {
  String _type;
  String _imageUrl;
  Color _color;

  SportType(this._type, this._color, this._imageUrl);

  Color get color => _color;

  String get imageUrl => _imageUrl;

  String get type => _type;
}