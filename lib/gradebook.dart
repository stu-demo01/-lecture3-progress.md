import 'student.dart';
import 'logger.dart';

class GradeBook with Logger {
  final List<Student> _students;

  GradeBook(List<Student> students) : _students = students;

  List<Student> get students => _students;

  double get average {
    final avg =
        _students.map((s) => s.score).reduce((a, b) => a + b) / _students.length;
    log('average=$avg');
    return avg;
  }

  Student get maxBy {
    final m = _students.reduce((a, b) => a.score >= b.score ? a : b);
    log('maxBy=${m.name}');
    return m;
  }

  int get countPassed {
    final c = _students.where((s) => s.score >= 60).length;
    log('countPassed=$c');
    return c;
  }

  Map<String, List<Student>> get groupByGrade {
    String tier(double score) {
      if (score >= 85) return '优';
      if (score >= 75) return '良';
      if (score >= 60) return '中';
      return '差';
    }

    final r = _students.fold(
      <String, List<Student>>{},
      (acc, s) => acc..putIfAbsent(tier(s.score), () => <Student>[]).add(s),
    );
    log('groupByGrade keys=${r.keys.toList()}');
    return r;
  }
}
