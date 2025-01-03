import 'package:flutter/material.dart';


class ComputerCoursesScreen extends StatefulWidget {
  @override
  _ComputerCoursesScreenState createState() => _ComputerCoursesScreenState();
}

class _ComputerCoursesScreenState extends State<ComputerCoursesScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> _courses = [
    {
      'title': 'Web Development Fundamentals',
      'image': 'assets/auth/web_development.jpg'
    },
    {
      'title': 'Data Science & Analytics',
      'image': 'assets/auth/data_science.jpg'
    },
    {
      'title': 'AI & Machine Learning',
      'image': 'assets/auth/ai_ml.jpg'
    },
  ];

  String _searchQuery = '';
  List<String> _suggestions = [];

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
      if (_searchQuery.length >= 2) {
        _suggestions = _courses
            .where((course) => course['title']
                .toLowerCase()
                .contains(_searchQuery.toLowerCase()))
            .map((course) => course['title'] as String)
            .toList();
      } else {
        _suggestions = [];
      }
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _searchQuery = '';
      _suggestions = [];
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredCourses = _courses
        .where((course) => course['title']
            .toLowerCase()
            .contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Computer Courses'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search courses...',
                prefixIcon: Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: _clearSearch,
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          if (_suggestions.isNotEmpty)
            Container(
              constraints: BoxConstraints(
              maxHeight: _suggestions.length * 50.0, // Adjust the height based on the number of suggestions
              ),
              child: ListView.builder(
              shrinkWrap: true,
              itemCount: _suggestions.length,
              itemBuilder: (context, index) {
                return ListTile(
                title: Text(_suggestions[index]),
                onTap: () {
                  setState(() {
                  _searchController.text = _suggestions[index];
                  _searchQuery = _suggestions[index];
                  _suggestions = [];
                  });
                },
                );
              },
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCourses.length,
              itemBuilder: (context, index) {
                final course = filteredCourses[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Image.asset(
                        course['image'],
                        fit: BoxFit.cover,
                        height: 150.0, // Set the desired height
                        width: double.infinity, // Make the image take full width
                        ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          course['title'],
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                        Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple,
                          minimumSize: Size(double.infinity, 36), // Increase width
                          ),
                          child: Text('View Details'),
                        ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
