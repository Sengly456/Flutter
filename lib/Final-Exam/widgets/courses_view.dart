import 'package:flutter/material.dart';
import 'course_view.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    // Courses with student data
    final courses = [
      {
        'title': 'HTML',
        'students': [
          {'name': 'Alice', 'score': 95.0},
          {'name': 'Bob', 'score': 78.0},
          {'name': 'Charlie', 'score': 62.0},
        ],
      },
      {
        'title': 'CSS',
        'students': [
          {'name': 'David', 'score': 88.0},
          {'name': 'Eve', 'score': 54.0},
        ],
      },
      {
        'title': 'JavaScript',
        'students': [], // No students
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Score App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          final List<Map<String, dynamic>> students =
              course['students'] as List<Map<String,dynamic >>;

         
          final int studentCount = students.length;

          //check average
          double? averageScore;
          if (students.isNotEmpty) {
            final double totalScore = students.fold(0.0, (sum, student) {
              return sum + (student['score'] as double);
            });
            averageScore = totalScore / studentCount;
          }

          return ListTile(
            title: Text(course['title'] as String),
            subtitle: Text(
              studentCount > 0
                  ? "$studentCount scores\nAverage: ${averageScore?.toStringAsFixed(1) ?? 'N/A'}"
                  : "No scores",
            ),
            onTap: () {
              // Navigate to the CourseView screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseView(
                    courseName: course['title'] as String,
                    students: students,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
