class Job {
  String _title;
  int _yearsOfExperience;
  String _education;
  String _postalCode;
  var _skills;

  // Constructor
  Job(this._title, this._yearsOfExperience, this._education, this._postalCode, this._skills);

  // Getters
  String get title => _title;
  int get yearsOfExperience => _yearsOfExperience;
  String get education => _education;
  String get postalCode => _postalCode;
   get skills => _skills;

  // Setters
  set title(String title) {
    _title = title;
  }

  set yearsExperience(int years_yearsOfExperience) {
    _yearsOfExperience = _yearsOfExperience;
  }

  set education(String education) {
    _education = education;
  }

  set postalCode(String postalCode) {
    _postalCode = postalCode;
  }

  set skills(var skills) {
    _skills = skills;
  }
}