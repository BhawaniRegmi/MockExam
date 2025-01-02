import 'package:flutter/material.dart';


class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text(
        "Profile",
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 1,
      iconTheme: const IconThemeData(color: Colors.black),
      leading: IconButton(
        icon: const Icon(Icons.home, color: Colors.black),
        onPressed: () {},
      ),
      actions: [
        IconButton(
        icon: const Icon(Icons.notifications),
        onPressed: () {},
        ),
        IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () {},
        ),
      ],
      ),
      drawer: const Drawer(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/auth/profile.jpg'),
                    ),
                    Positioned(
                      top: 70,
                      left: 60,
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt),
                        onPressed: () {},
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  "Bhawani Regmi",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text("Student ID: ST2024135"),
              ],
            ),
          ),
         
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Personal Information", style: TextStyle(fontSize: 18)),
                  const Divider(),
                  InfoRow(label: "Date of Birth", value: "March 15, 2002"),
                  InfoRow(label: "Contact", value: "+977 98657816842"),
                  InfoRow(label: "Email", value: "abhinashp@gmail.com"),
                  InfoRow(label: "Department", value: "LokSewa"),
                  InfoRow(label: "Batch", value: "3rd Batch"),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Current Courses", style: TextStyle(fontSize: 18)),
                  const Divider(),
                  CourseRow(
                    courseName: "Kharidar Loksewa",
                    instructor: "CS401 - Prof. Williams",
                    progress: "92%",
                    progressColor: Colors.green,
                  ),
                  CourseRow(
                    courseName: "Adhikrit LokSewa",
                    instructor: "CS402 - Prof. Anderson",
                    progress: "88%",
                    progressColor: Colors.green,
                  ),
                  CourseRow(
                    courseName: "Subba LokSewa",
                    instructor: "CS403 - Prof. Martinez",
                    progress: "75%",
                    progressColor: Colors.orange,
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Attendance Overview", style: TextStyle(fontSize: 18)),
                  const Divider(),
                  LinearProgressIndicator(
                    value: 0.92,
                    backgroundColor: Colors.grey[300],
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AttendanceStat(label: "Present", value: "138"),
                      AttendanceStat(label: "Absent", value: "12"),
                      AttendanceStat(label: "Leave", value: "5"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Test Results", style: TextStyle(fontSize: 18)),
                  const Divider(),
                  TestResultRow(
                    testName: "Midterm Exam",
                    subject: "Advanced Algorithms",
                    score: "95/100",
                    scoreColor: Colors.green,
                  ),
                  TestResultRow(
                    testName: "Final Project",
                    subject: "Database Systems",
                    score: "88/100",
                    scoreColor: Colors.green,
                  ),
                  TestResultRow(
                    testName: "Quiz Series",
                    subject: "Software Engineering",
                    score: "78/100",
                    scoreColor: Colors.orange,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
   
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value),
        ],
      ),
    );
  }
}

class CourseRow extends StatelessWidget {
  final String courseName;
  final String instructor;
  final String progress;
  final Color progressColor;

  CourseRow({
    required this.courseName,
    required this.instructor,
    required this.progress,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(courseName, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(instructor, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          Text(progress, style: TextStyle(color: progressColor)),
        ],
      ),
    );
  }
}

class AttendanceStat extends StatelessWidget {
  final String label;
  final String value;

  AttendanceStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label),
      ],
    );
  }
}

class TestResultRow extends StatelessWidget {
  final String testName;
  final String subject;
  final String score;
  final Color scoreColor;

  TestResultRow({
    required this.testName,
    required this.subject,
    required this.score,
    required this.scoreColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(testName, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(subject, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          Text(score, style: TextStyle(color: scoreColor)),
        ],
      ),
    );
  }
}
