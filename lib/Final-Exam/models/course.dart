class Course {
  String name;
  List<StudentScore> scores;
  Course({required this.name,required this.scores});
}

class StudentScore{
  String name;
  double score;
  StudentScore({required this.name,required this.score});
}