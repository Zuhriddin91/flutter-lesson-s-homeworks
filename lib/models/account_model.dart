

class Account {
  String _name;
  String _subtitle;
  String _imageUrl;
  String _activeTime;
  bool _pinned;

  Account(this._name, this._subtitle, this._activeTime,
      this._pinned, this._imageUrl,);

  bool get pinned => _pinned;

  String get activeTime => _activeTime;

  String get imageUrl => _imageUrl;

  String get subtitle => _subtitle;

  String get name => _name;
}
