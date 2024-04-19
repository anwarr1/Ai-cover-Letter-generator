class Company {
String _name;
String _address;
String _department;
String get name => _name;
set name(String value) => _name = value;

String get address => _address;
set address(String value) => _address = value;

String get department => _department;
set department(String value) => _department = value;

Company(this._name, this._address, this._department);

}
