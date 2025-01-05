import 'package:flutter/material.dart';

class CourseInquiryForm extends StatefulWidget {
  @override
  _CourseInquiryFormState createState() => _CourseInquiryFormState();
}

class _CourseInquiryFormState extends State<CourseInquiryForm> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> _courses = [
    'Computer Science Basics',
    'Advanced Java Programming',
    'Flutter Development',
    'Web Development',
    'Python for Data Science',
    'Machine Learning',
    'Artificial Intelligence',
    'Database Management Systems',
    'Networking Essentials'
  ];

  List<String> _filteredCourses = [];
  String? _selectedCourse;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _filterCourses(_searchController.text);
      });
    });
  }

  void _filterCourses(String query) {
    if (query.isEmpty) {
      _filteredCourses = [];
      return;
    }

    _filteredCourses = _courses
        .where((course) => course.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _filteredCourses = [];
      _selectedCourse = null;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && _selectedCourse != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Thank you for your time. Your inquiry is sent.')),
      );
      Navigator.pop(context);
    } else if (_selectedCourse == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a course.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Course Inquiry Form',
          style: TextStyle(color: Colors.black),
        ), 
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.home, color: Colors.black),
          onPressed: () {
        // Handle home button press
          },
        ),
        actions: [
          IconButton(
        icon: Icon(Icons.notifications, color: Colors.black),
        onPressed: () {
          // Handle notification button press
        },
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Search Courses *',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search for courses...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: _clearSearch,
                              )
                            : null,
                      ),
                      validator: (value) {
                        if (_selectedCourse == null) {
                          return 'Please select a course';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                     Text(
                      'Enter Full Name *',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Full Name *',
                        hintText: 'Enter your full name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length < 3) {
                          return 'Please enter a valid name (at least 3 characters)';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                     Text(
                      'Enter Email Address *',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email Address *',
                        hintText: 'Enter your email address',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                     Text(
                      'Enter Phone Number *',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: 'Phone Number *',
                        hintText: 'Enter your phone number',
                        
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty || !RegExp(r'^9\d{9}$').hasMatch(value)) {
                          return 'Please enter a valid phone number (starting with 9 and 10 digits)';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                     Text(
                      'Enter Additional Comments *',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _commentsController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: 'Additional Comments',
                        hintText: 'Enter any additional information or specific requirements',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: _submitForm,
                      icon: Icon(Icons.send),
                      label: Text('Send Inquiry'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'By submitting this form, you agree to our Privacy Policy and Terms of Service. Your information will be handled securely and confidentially.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_filteredCourses.isNotEmpty)
            Positioned(
              top: 100,
              left: 16,
              right: 16,
              child: Card(
                elevation: 4,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _filteredCourses.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_filteredCourses[index]),
                      onTap: () {
                        setState(() {
                          _selectedCourse = _filteredCourses[index];
                          _searchController.text = _selectedCourse!;
                          _filteredCourses = [];
                        });
                      },
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
