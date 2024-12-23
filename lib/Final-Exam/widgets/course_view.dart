import 'package:flutter/material.dart';
import 'package:my_app/Final-Exam/widgets/score_form.dart';

class CourseView extends StatelessWidget {
  final String courseName;
  final List<Map<String, dynamic>> students; // List of students

  const CourseView({
    super.key,
    required this.courseName,
    required this.students,
  });

  // Method to determine the score color
  Color getScoreColor(double score) {
    if (score >= 80) {
      return Colors.green;
    } else if (score >= 50) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(courseName),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
             //navigation
               Navigator.push(context, MaterialPageRoute(builder:(context) => const NewItem()));
            },
          ),
        ],
      ),
      body: students.isNotEmpty
          ? ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return ListTile(
                  title: Text(student['name']),
                  trailing: Text(
                    student['score'].toString(),
                    style: TextStyle(color: getScoreColor(student['score'])),
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                "No students available for this course.",
                style: TextStyle(fontSize: 16),
              ),
            ),
    );
  }
}
