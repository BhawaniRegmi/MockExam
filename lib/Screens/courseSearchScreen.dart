import 'package:flutter/material.dart';

class CourseSearchScreen extends StatefulWidget {
  @override
  _CourseSearchScreenState createState() => _CourseSearchScreenState();
}

class _CourseSearchScreenState extends State<CourseSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> suggestions = [];
  List<Course> filteredCourses = [];
  
  // List of courses
  final List<Course> courses = [
    Course("Loksewa Preparation Course", "Duration: 16 weeks", "Rs 13,999"),
    Course("IELTS Preparation Course", "Duration: 12 weeks", "Rs 5,999"),
    Course("TOEFL iBT Course", "Duration: 10 weeks", "Rs2,279"),
    Course("GRE Advanced Prep", "Duration: 14 weeks", "Rs3,399"),
    Course("GMAT Business Ready", "Duration: 16 weeks", "Rs 4,449"),
    Course("PTE Academic Course", "Duration: 8 weeks", "Rs 2,249"),
    Course("Academic Bridge Program", "Duration: 24 weeks", "Rs 5,599"),
  ];

  @override
  void initState() {
    super.initState();
    filteredCourses = courses; // Initially show all courses
  }

void _onSearchChanged(String query) {
  setState(() {
    if (query.length >= 2) {
      // Update suggestions if input has at least 2 characters
      suggestions = courses
          .map((course) => course.name)
          .where((courseName) =>
              courseName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      // Clear suggestions if input is less than 2 characters
      suggestions = [];
    }

    // Update filtered courses based on query
    filteredCourses = courses
        .where((course) =>
            course.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  });
}


  void _onSuggestionSelected(String suggestion) {
    setState(() {
      _searchController.text = suggestion;

      // Filter courses based on selected suggestion
      filteredCourses = courses
          .where((course) =>
              course.name.toLowerCase().contains(suggestion.toLowerCase()))
          .toList();
      suggestions = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Courses', style: TextStyle(color: Colors.black))),
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.home, color: Colors.black),
            onPressed: () {
              // Notification action
            },
          ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Notification action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            Container(
              height: 50,
              child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: "Search Courses...",
                prefixIcon: Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                    setState(() {
                      _searchController.clear();
                      suggestions = [];
                      filteredCourses = courses;
                    });
                    },
                  )
                  : null,
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                ),
              ),
              ),
            ),

            SizedBox(height: 8),

            // Suggestions
            if (suggestions.isNotEmpty)
              Container(
                margin: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade200,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: suggestions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(suggestions[index]),
                      onTap: () => _onSuggestionSelected(suggestions[index]),
                    );
                  },
                ),
              ),

            // Filtered Courses
            Expanded(
              child: ListView.builder(
                itemCount: filteredCourses.length,
                itemBuilder: (context, index) {
                  final course = filteredCourses[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.name,
                            style: TextStyle(
                              fontSize: size.width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(course.duration),
                          SizedBox(height: 4),
                          Text(
                            course.price,
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple,
                                ),
                                child: Text("View details"),
                              ),
                              SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple,
                                ),
                                child: Text("Enroll Now"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Course Model
class Course {
  final String name;
  final String duration;
  final String price;

  Course(this.name, this.duration, this.price);
}
