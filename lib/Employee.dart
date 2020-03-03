class Employee {
  int _id;
  String _name;
  double _salary;

  Employee(this._id, this._name, this._salary);

  //setter

  set salary(double salary) {
    _salary = salary;
  }

  set name(String name) {
    _name = name;
  }

  set id(int id) {
    _id = id;
  }

  //getter

  int get id => this._id;

  String get name => this._name;

  double get salary => this._salary;
}
