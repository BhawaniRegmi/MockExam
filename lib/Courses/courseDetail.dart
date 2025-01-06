import 'package:flutter/material.dart';
import 'package:mock_exam/Courses/inquiry.dart';

class CourseDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Course Details',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/auth/web_development.jpg', // Replace with your image path
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Advanced Web Development Masterclass',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 4),
                      Text('4.8 (2,345 reviews)'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoCard(label: 'Duration', value: '12 Weeks'),
                      InfoCard(label: 'Language', value: 'English'),
                      InfoCard(label: 'Level', value: 'Advanced'),
                    ],
                  ),
                  const SizedBox(height: 10),
               
                  ProjectCard(
                    title: 'Course Description',
                    description:
                        'Master modern web development with this comprehensive course. Learn advanced JavaScript, React.js, Node.js, and cloud deployment. Perfect for developers looking to level up their skills and build professional full-stack applications.'),
                 
                 const SizedBox(height: 10),
                    Row(
                    children: [
                      Image.asset(
                        'assets/auth/profile.jpg', // Replace with your image path
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Instructor",style: TextStyle(fontSize: 18,color: Colors.black87, fontWeight: FontWeight.bold),),
                          Text(
                            'Dr. Michael Anderson',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('Senior Web Developer & Educator'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '15+ years of industry experience. Former Tech Lead at Google. PhD in Computer Science from Stanford University.',
                  ),
                  
                  const SizedBox(height: 16),
                  const Text(
                    'What You\'ll Learn',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children: const [
                      ListTile(
                        leading: Icon(Icons.check_circle, color: Colors.green),
                        title: Text('Advanced JavaScript concepts and ES6+ features'),
                      ),
                      ListTile(
                        leading: Icon(Icons.check_circle, color: Colors.green),
                        title: Text('React.js with Redux and Modern Hooks'),
                      ),
                      ListTile(
                        leading: Icon(Icons.check_circle, color: Colors.green),
                        title: Text('Node.js and Express.js backend development'),
                      ),
                      ListTile(
                        leading: Icon(Icons.check_circle, color: Colors.green),
                        title: Text('Database design with MongoDB and PostgreSQL'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Course Content',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const ExpansionTile(
                    title: Text('Module 1: Introduction to Web Development'),
                    children: [
                      ListTile(
                        title: Text('Lesson 1: HTML Basics'),
                      ),
                      ListTile(
                        title: Text('Lesson 2: CSS Fundamentals'),
                      ),
                      ListTile(
                        title: Text('Lesson 3: JavaScript Essentials'),
                      ),
                    ],
                  ),
                  const ExpansionTile(
                    title: Text('Module 2: Advanced JavaScript'),
                    children: [
                      ListTile(
                        title: Text('Lesson 1: ES6+ Features'),
                      ),
                      ListTile(
                        title: Text('Lesson 2: Asynchronous JavaScript'),
                      ),
                      ListTile(
                        title: Text('Lesson 3: JavaScript Design Patterns'),
                      ),
                    ],
                  ),
                  const ExpansionTile(
                    title: Text('Module 3: React.js'),
                    children: [
                      ListTile(
                        title: Text('Lesson 1: React Basics'),
                      ),
                      ListTile(
                        title: Text('Lesson 2: State and Props'),
                      ),
                      ListTile(
                        title: Text('Lesson 3: React Hooks'),
                      ),
                    ],
                  ),
                  const ExpansionTile(
                    title: Text('Module 4: Backend Development with Node.js'),
                    children: [
                      ListTile(
                        title: Text('Lesson 1: Node.js Basics'),
                      ),
                      ListTile(
                        title: Text('Lesson 2: Express.js Framework'),
                      ),
                      ListTile(
                        title: Text('Lesson 3: RESTful APIs'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Projects',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ProjectCard(
                    title: 'E-commerce Platform',
                    description:
                        'Build a full-featured online store with shopping cart and payment integration.',
                  ),
                  ProjectCard(
                    title: 'Social Media Dashboard',
                    description:
                        'Create a responsive dashboard with real-time data visualization.',
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Certificate Earned',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Image.asset(
                    'assets/auth/ce.png', // Replace with your actual certificate image path
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Demo Class Video',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          height: 150,
                          width: 120,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/auth/demo.jpeg'), // Replace with your image path
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(Icons.play_circle_fill, size: 48, color: Colors.blue),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          height: 150,
                          width: 120,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/auth/de.png'), // Replace with your image path
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(Icons.play_circle_fill, size: 48, color: Colors.blue),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          height: 150,
                          width: 120,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/auth/dem.jpeg'), // Replace with your image path
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(Icons.play_circle_fill, size: 48, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Career Options',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Graduates of this course can pursue careers such as Web Developer, Full-stack Developer, Frontend Engineer, Backend Engineer, and Cloud Specialist.',
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Frequently Asked Questions',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  FAQItem(
                    question: 'What is the duration of the course?',
                    answer: 'The course lasts for 12 weeks.',
                  ),
                  FAQItem(
                    question: 'Are there any prerequisites?',
                    answer: 'Basic knowledge of programming and web development is recommended.',
                  ),
                  FAQItem(
                    question: 'Is there a certification upon completion?',
                    answer: 'Yes, a certificate will be provided after successful completion.',
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Related Courses',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  RelatedCourseCard(
                    title: 'Introduction to Data Science',
                    description: 'Learn the fundamentals of data science including Python, data analysis, and machine learning.',
                    imageUrl: 'assets/auth/data_science.jpg', // Replace with your image URL
                  ),
                  RelatedCourseCard(
                    title: 'Full-Stack Development Bootcamp',
                    description: 'Become a full-stack developer with this intensive bootcamp.',
                    imageUrl: 'assets/auth/ai_ml.jpg', // Replace with your image URL
                  ),
                  const SizedBox(height: 65),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'RS12,999',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CourseInquiryForm()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple,
                        minimumSize: const Size(double.infinity, 48), // Extend button width to screen width
                      ),
                      child: const Text('Enroll Now', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CourseInquiryForm()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      minimumSize: const Size(48, 48), // Set button width to 48
                    ),
                    child: const Text('Inquiry', style: TextStyle(color: Colors.white)),
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

class InfoCard extends StatelessWidget {
  final String label;
  final String value;

  InfoCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(value),
      ],
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;

  ProjectCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(answer),
        ],
      ),
    );
  }
}

class RelatedCourseCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  RelatedCourseCard({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(description),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    minimumSize: const Size(double.infinity, 36), // Extend button width to screen width
                  ),
                  child: const Text('Learn More'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
