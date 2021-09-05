
class CourseClass {

  String _name;
  String _description;
  String _image;

  CourseClass(this._name, this._description, this._image);

  String get image => _image;

  String get description => _description;

  String get name => _name;
}