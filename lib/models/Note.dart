class Note {
  int _id;
  String _title;
  String _desc;
  String _date;
  int _pri;

  Note(this._title, this._date, this._pri, [this._desc]);

  Note.withId(this._id, this._title, this._date, this._pri, [this._desc]);

  int get pri => _pri;

  String get date => _date;

  String get desc => _desc;

  String get title => _title;

  int get id => _id;

  set pri(int value) {
    _pri = value;
  }

  set date(String value) {
    _date = value;
  }

  set desc(String value) {
    _desc = value;
  }

  set title(String value) {
    _title = value;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (_id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['desc'] = _desc;
    map['date'] = _date;
    map['pri'] = _pri;
    return map;
  }

  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._desc = map['desc'];
    this._pri = map['pri'];
    this._date = map['date'];
  }
}
