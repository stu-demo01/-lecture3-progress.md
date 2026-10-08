import 'package:test/test.dart';
import 'package:dart_oo/student.dart';
import 'package:dart_oo/gradebook.dart';

void main() {
  test('正常数据统计正确', () {
    final s1 = Student('Alice', 18, 90);
    final s2 = Student('Bob', 19, 50);
    final s3 = Student('Carol', 20, 80);
    final gb = GradeBook([s1, s2, s3]);

    expect(gb.average, closeTo((90 + 50 + 80) / 3, 1e-9));
    expect(gb.maxBy.name, equals('Alice'));
    expect(gb.countPassed, equals(2));
    expect(gb.groupByGrade['优']!.map((s) => s.name).toList(), equals(['Alice']));
    expect(gb.groupByGrade['良']!.map((s) => s.name).toList(), equals(['Carol']));
    expect(gb.groupByGrade['差']!.map((s) => s.name).toList(), equals(['Bob']));
  });

  test('越界分数抛异常', () {
    expect(() => Student('Dan', 18, 101), throwsArgumentError);
    expect(
      () => Student.fromJson({'name': 'Eve', 'age': 18, 'score': -5}),
      throwsArgumentError,
    );
  });
}
