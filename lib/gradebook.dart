import 'student.dart';

class GradeBook {
  final List<Student> _students;

  GradeBook(List<Student> students) : _students = students;

  List<Student> get students => _students;
}
