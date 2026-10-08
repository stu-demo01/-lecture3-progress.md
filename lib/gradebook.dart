import 'student.dart';

class GradeBook {
  final List<Student> _students;

  GradeBook(List<Student> students) : _students = students;

  List<Student> get students => _students;

  double get average =>
      _students.map((s) => s.score).reduce((a, b) => a + b) / _students.length;

  Student get maxBy => _students.reduce((a, b) => a.score >= b.score ? a : b);

  int get countPassed => _students.where((s) => s.score >= 60).length;

  Map<String, List<Student>> groupByGrade {
    String tier(double score) {
      if (score >= 85) return '优';
      if (score >= 75) return '良';
      if (score >= 60) return '中';
      return '差';
    }

    return _students.fold(
      <String, List<Student>>{},
      (acc, s) => acc..putIfAbsent(tier(s.score), () => <Student>[]).add(s),
    );
  }
}
