class Student {
  String _name;
  int _age;
  double _score;

  Student(String name, int age, double score)
      : _name = '',
        _age = 0,
        _score = 0 {
    this.name = name;
    this.age = age;
    this.score = score;
  }

  Student.fromJson(Map<String, dynamic> json)
      : _name = '',
        _age = 0,
        _score = 0 {
    name = json['name'] as String;
    age = json['age'] as int;
    score = (json['score'] as num).toDouble();
  }

  String get name => _name;
  int get age => _age;
  double get score => _score;

  set name(String value) {
    if (value.isEmpty) throw ArgumentError('name 不能为空');
    _name = value;
  }

  set age(int value) {
    if (value < 0) throw ArgumentError('age 不能为负');
    _age = value;
  }

  set score(double value) {
    if (value < 0 || value > 100) throw ArgumentError('score 范围 0-100');
    _score = value;
  }
}
