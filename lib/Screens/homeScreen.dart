import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mock_exam/Analytics/analytics.dart';
import 'package:mock_exam/Screens/courseSearchScreen.dart';
import 'package:mock_exam/Screens/exams.dart';
import 'package:mock_exam/Screens/profileScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ExamSearchScreen(),
    AnalyticsScreen(),
    CourseSearchScreen(),
    ProfileApp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // appBar: AppBar(
      //   title: const Text('Mock Exams'),
      //   backgroundColor: Colors.purple,
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.notifications),
      //       onPressed: () {
      //         // Notification action
      //       },
      //     ),
      //   ],
      // ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: "Tests"),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Analytics"),
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: "Courses"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    bool _showWelcomeBack = true;

  @override
  void initState() {
    super.initState();
    // Start a timer to hide the welcome back container after 10 seconds
    Timer(Duration(seconds:6), () {
      if (mounted) {
        setState(() {
          _showWelcomeBack = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.05;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Mock Exam', style: TextStyle(color: Colors.black))),
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
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
      drawer: Drawer(
        child: ListView(
          // Add your drawer items here
        ),
      ),




      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Special Offer Card
              Container(
                padding: EdgeInsets.all(size.width * 0.04),
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "🎁 Special Offer!\nGet 50% off on all Premium Mock Exams\nValid until Dec 31, 2023",
                        style: TextStyle(color: Colors.white, fontSize: size.width * 0.04),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                      onPressed: () {},
                      child: Text(
                        "Claim Now",
                        style: TextStyle(fontSize: size.width * 0.035),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
    
              // // Welcome Back Card
              // Container(
              //   padding: EdgeInsets.all(size.width * 0.04),
              //   decoration: BoxDecoration(
              //     color: Colors.black87,
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: Row(
              //     children: [
              //       CircleAvatar(
              //         backgroundImage: AssetImage('assets/auth/profile.jpg'),
              //         radius: size.width * 0.1,
              //       ),
              //       SizedBox(width: size.width * 0.04),
              //       Expanded(
              //         child: Text(
              //           "Welcome back, Emma!\nReady for today's practice?",
              //           style: TextStyle(color: Colors.white, fontSize: size.width * 0.04),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

    // Welcome Back Card
              if (_showWelcomeBack)
                Container(
                  padding: EdgeInsets.all(size.width * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/auth/profile.jpg'),
                        radius: size.width * 0.1,
                      ),
                      SizedBox(width: size.width * 0.04),
                      Expanded(
                        child: Text(
                          "Welcome back, Emma!\nReady for today's practice?",
                          style: TextStyle(color: Colors.white, fontSize: size.width * 0.04),
                        ),
                      ),
                    ],
                  ),
                ),



            //  SizedBox(height: size.height * 0.02),
            SizedBox(height: 20,),
    
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildOrderTile(
                        FontAwesomeIcons.plus,
                        'New Tests',
                        Colors.orange.shade100,
                        Colors.orange,
                      ),
                      _buildOrderTile(
                        FontAwesomeIcons.play,
                        'Resume',
                        Colors.blue.shade100,
                        Colors.blue,
                      ),
                      _buildOrderTile(
                        FontAwesomeIcons.lightbulb,
                        'Solutions',
                        Colors.green.shade100,
                        Colors.green,
                      ),
                      _buildOrderTile(
                        FontAwesomeIcons.book,
                        'Practice',
                        Colors.purple.shade100,
                        Colors.purple,
                      ),
                  ],
                ),
                
              SizedBox(height: 20,),
    
              // What We Do Section
              Text("What We Do", style: TextStyle(fontSize: size.width * 0.05, fontWeight: FontWeight.bold)),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                SizedBox(width: 150,
                  child: _buildFeatureCard("Expert Tutoring", size)),
                SizedBox(width: 20,),
                SizedBox(width: 150,
                  child: _buildFeatureCard("Practice Tests", size)),
                
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                SizedBox(width: 150,
                  child: _buildFeatureCard("Progress Tracking", size)),
                  SizedBox(width: 20,),
                 
                SizedBox(width: 150,
                  child: _buildFeatureCard("Study Group", size)),
                
                ],
              ),
              SizedBox(height: size.height * 0.02),
    
              // Exam Categories Section
              Text("Exam Categories", style: TextStyle(fontSize: size.width * 0.05, fontWeight: FontWeight.bold)),
              SizedBox(height: size.height * 0.01),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildExamCategory("IELTS", "assets/auth/ielts.png", size),
                    _buildExamCategory("Korean", "assets/auth/korean.png", size),
                    _buildExamCategory("LokSewa", "assets/auth/lokSewa.jpeg", size),
                     _buildExamCategory("Gre", "assets/auth/gre.png", size),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
    
                // Special Offer Card
              Container(
                padding: EdgeInsets.all(size.width * 0.04),
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Ielts Practice test",
                        style: TextStyle(color: Colors.white, fontSize: size.width * 0.04),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                      onPressed: () {},
                      child: Text(
                        "Start Now",
                        style: TextStyle(fontSize: size.width * 0.035),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:20),
    
              // Upcoming Exams
              Text("Upcoming Exams", style: TextStyle(fontSize: size.width * 0.05, fontWeight: FontWeight.bold)),
              SizedBox(height: size.height * 0.01),
             // _buildUpcomingExam("PTE", "Dec 15, 2:00 PM", size),
             _buildCourseCard1("PTE", "Dec 15, 2:00 PM", size),
    
              // Popular Courses Section
              SizedBox(height: size.height * 0.02),
              Text("Popular Courses", style: TextStyle(fontSize: size.width * 0.05, fontWeight: FontWeight.bold)),
              SizedBox(height: size.height * 0.01),
              _buildCourseCard("Loksewa", "All Papers Preparation with Interview", size),
              _buildCourseCard("Graphic Design", "Master Adobe Creative Suite", size),
              _buildCourseCard("Digital Marketing", "SEO, Social Media, Analytics", size),
    
              // Student Testimonials
              SizedBox(height: size.height * 0.02),
              Text("Student Testimonials", style: TextStyle(fontSize: size.width * 0.05, fontWeight: FontWeight.bold)),
              SizedBox(height: size.height * 0.01),
              _buildTestimonial("Sarah Chen", 5, "The IELTS preparation course helped me achieve my target score.", size),
              _buildTestimonial("John Smith", 4.5, "Expert tutoring helped me understand complex GRE concepts.", size),
              _buildTestimonial("Emily Wang", 5, "Study groups were invaluable for exam preparation.", size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, Size size) {
    return Column(
      children: [
        CircleAvatar(
          radius: size.width * 0.08,
          backgroundColor: Colors.purple,
          child: Icon(icon, color: Colors.white, size: size.width * 0.06),
        ),
        SizedBox(height: size.height * 0.01),
        Text(label, style: TextStyle(color: Colors.black87, fontSize: size.width * 0.035)),
      ],
    );
  }

  Widget _buildFeatureCard(String title, Size size) {
    return Container(
      padding: EdgeInsets.all(size.width * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: size.width * 0.035),
      ),
    );
  }

  Widget _buildExamCategory(String title, String imagePath, Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.02),
      child: Column(
        children: [
          Image.asset(imagePath, width:90, height: 80, fit: BoxFit.cover),
          SizedBox(height: size.height * 0.01),
          Text(title, style: TextStyle(fontSize: size.width * 0.04)),
        ],
      ),
    );
  }

  Widget _buildUpcomingExam(String exam, String time, Size size) {
    return ListTile(
      title: Text(exam, style: TextStyle(fontSize: size.width * 0.045)),
      subtitle: Text(time, style: TextStyle(fontSize: size.width * 0.035)),
      trailing: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
        child: Text("Set Reminder", style: TextStyle(fontSize: size.width * 0.035)),
      ),
    );
  }

  Widget _buildCourseCard(String course, String description, Size size) {
    return Card(
      child: ListTile(
        title: Text(course, style: TextStyle(fontSize: size.width * 0.045)),
        subtitle: Text(description, style: TextStyle(fontSize: size.width * 0.035)),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
          child: Text("Explore", style: TextStyle(fontSize: size.width * 0.035)),
        ),
      ),
    );
  }

    Widget _buildCourseCard1(String course, String description, Size size) {
    return Card(
      child: ListTile(
        title: Text(course, style: TextStyle(fontSize: size.width * 0.045)),
        subtitle: Text(description, style: TextStyle(fontSize: size.width * 0.035)),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
          child: Text("Set Reminder", style: TextStyle(fontSize: size.width * 0.035)),
        ),
      ),
    );
  }

  Widget _buildTestimonial(String name, double rating, String comment, Size size) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage('assets/auth/profile.jpg')),
      title: Text(name, style: TextStyle(fontSize: size.width * 0.045)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: size.width * 0.04,
              ),
            ),
          ),
          Text(comment, style: TextStyle(fontSize: size.width * 0.035)),
        ],
      ),
    );
  }
}







class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Profile Screen"));
  }
}



  Widget _buildOrderTile(
      IconData icon, String label, Color backgroundColor, Color iconColor) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 20, // Reduced size
          backgroundColor: backgroundColor,
          child: Icon(
            icon,
            color: iconColor,
            size: 16, // Reduced size
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10), // Adjusted font size
        ),
      ],
    );
  }





// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool _showWelcomeBack = true;

//   @override
//   void initState() {
//     super.initState();
//     // Start a timer to hide the welcome back container after 10 seconds
//     Timer(Duration(seconds: 10), () {
//       if (mounted) {
//         setState(() {
//           _showWelcomeBack = false;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final padding = size.width * 0.05;

//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: const Text('Mock Exam', style: TextStyle(color: Colors.black))),
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: Icon(Icons.menu, color: Colors.black),
//           onPressed: () {
//             // Notification action
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications, color: Colors.black),
//             onPressed: () {
//               // Notification action
//             },
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           // Add your drawer items here
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(padding),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Special Offer Card
//               Container(
//                 padding: EdgeInsets.all(size.width * 0.04),
//                 decoration: BoxDecoration(
//                   color: Colors.blue[800],
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         "🎁 Special Offer!\nGet 50% off on all Premium Mock Exams\nValid until Dec 31, 2023",
//                         style: TextStyle(color: Colors.white, fontSize: size.width * 0.04),
//                       ),
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
//                       onPressed: () {},
//                       child: Text(
//                         "Claim Now",
//                         style: TextStyle(fontSize: size.width * 0.035),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: size.height * 0.02),

//               // Welcome Back Card
//               if (_showWelcomeBack)
//                 Container(
//                   padding: EdgeInsets.all(size.width * 0.04),
//                   decoration: BoxDecoration(
//                     color: Colors.black87,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundImage: AssetImage('assets/auth/profile.jpg'),
//                         radius: size.width * 0.1,
//                       ),
//                       SizedBox(width: size.width * 0.04),
//                       Expanded(
//                         child: Text(
//                           "Welcome back, Emma!\nReady for today's practice?",
//                           style: TextStyle(color: Colors.white, fontSize: size.width * 0.04),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               SizedBox(height: 20),

//                 Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     _buildOrderTile(
//                         FontAwesomeIcons.plus,
//                         'New Tests',
//                         Colors.orange.shade100,
//                         Colors.orange,
//                       ),
//                       _buildOrderTile(
//                         FontAwesomeIcons.play,
//                         'Resume',
//                         Colors.blue.shade100,
//                         Colors.blue,
//                       ),
//                       _buildOrderTile(
//                         FontAwesomeIcons.lightbulb,
//                         'Solutions',
//                         Colors.green.shade100,
//                         Colors.green,
//                       ),
//                       _buildOrderTile(
//                         FontAwesomeIcons.book,
//                         'Practice',
//                         Colors.purple.shade100,
//                         Colors.purple,
//                       ),
//                   ],
//                 ),
                
//               SizedBox(height: 20,),
    
//               // What We Do Section
//               Text("What We Do", style: TextStyle(fontSize: size.width * 0.05, fontWeight: FontWeight.bold)),
//               SizedBox(height: 20,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                 SizedBox(width: 150,
//                   child: _buildFeatureCard("Expert Tutoring", size)),
//                 SizedBox(width: 20,),
//                 SizedBox(width: 150,
//                   child: _buildFeatureCard("Practice Tests", size)),
                
//                 ],
//               ),
//               SizedBox(height: size.height * 0.02),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                 SizedBox(width: 150,
//                   child: _buildFeatureCard("Progress Tracking", size)),
//                   SizedBox(width: 20,),
                 
//                 SizedBox(width: 150,
//                   child: _buildFeatureCard("Study Group", size)),
                
//                 ],
//               ),
//               SizedBox(height: size.height * 0.02),
    
//               // Exam Categories Section
//               Text("Exam Categories", style: TextStyle(fontSize: size.width * 0.05, fontWeight: FontWeight.bold)),
//               SizedBox(height: size.height * 0.01),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     _buildExamCategory("IELTS", "assets/auth/ielts.png", size),
//                     _buildExamCategory("Korean", "assets/auth/korean.png", size),
//                     _buildExamCategory("LokSewa", "assets/auth/lokSewa.jpeg", size),
//                   ],
//                 ),
//               ),
//               SizedBox(height: size.height * 0.02),
    
//                 // Special Offer Card
//               Container(
//                 padding: EdgeInsets.all(size.width * 0.04),
//                 decoration: BoxDecoration(
//                   color: Colors.blue[800],
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         "Ielts Practice test",
//                         style: TextStyle(color: Colors.white, fontSize: size.width * 0.04),
//                       ),
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
//                       onPressed: () {},
//                       child: Text(
//                         "Start Now",
//                         style: TextStyle(fontSize: size.width * 0.035),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height:20),
    
//               // Upcoming Exams
//               Text("Upcoming Exams", style: TextStyle(fontSize: size.width * 0.05, fontWeight: FontWeight.bold)),
//               SizedBox(height: size.height * 0.01),
//              // _buildUpcomingExam("PTE", "Dec 15, 2:00 PM", size),
//              _buildCourseCard1("PTE", "Dec 15, 2:00 PM", size),
    
//               // Popular Courses Section
//               SizedBox(height: size.height * 0.02),
//               Text("Popular Courses", style: TextStyle(fontSize: size.width * 0.05, fontWeight: FontWeight.bold)),
//               SizedBox(height: size.height * 0.01),
//               _buildCourseCard("Loksewa", "All Papers Preparation with Interview", size),
//               _buildCourseCard("Graphic Design", "Master Adobe Creative Suite", size),
//               _buildCourseCard("Digital Marketing", "SEO, Social Media, Analytics", size),
    
//               // Student Testimonials
//               SizedBox(height: size.height * 0.02),
//               Text("Student Testimonials", style: TextStyle(fontSize: size.width * 0.05, fontWeight: FontWeight.bold)),
//               SizedBox(height: size.height * 0.01),
//               _buildTestimonial("Sarah Chen", 5, "The IELTS preparation course helped me achieve my target score.", size),
//               _buildTestimonial("John Smith", 4.5, "Expert tutoring helped me understand complex GRE concepts.", size),
//               _buildTestimonial("Emily Wang", 5, "Study groups were invaluable for exam preparation.", size),

//               // Remaining code...
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



//   Widget _buildActionButton(IconData icon, String label, Size size) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: size.width * 0.08,
//           backgroundColor: Colors.purple,
//           child: Icon(icon, color: Colors.white, size: size.width * 0.06),
//         ),
//         SizedBox(height: size.height * 0.01),
//         Text(label, style: TextStyle(color: Colors.black87, fontSize: size.width * 0.035)),
//       ],
//     );
//   }

//   Widget _buildFeatureCard(String title, Size size) {
//     return Container(
//       padding: EdgeInsets.all(size.width * 0.03),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
//       ),
//       child: Text(
//         title,
//         textAlign: TextAlign.center,
//         style: TextStyle(fontSize: size.width * 0.035),
//       ),
//     );
//   }

//   Widget _buildExamCategory(String title, String imagePath, Size size) {
//     return Padding(
//       padding: EdgeInsets.all(size.width * 0.02),
//       child: Column(
//         children: [
//           Image.asset(imagePath, width: size.width * 0.25, height: size.width * 0.2, fit: BoxFit.cover),
//           SizedBox(height: size.height * 0.01),
//           Text(title, style: TextStyle(fontSize: size.width * 0.04)),
//         ],
//       ),
//     );
//   }

//   Widget _buildUpcomingExam(String exam, String time, Size size) {
//     return ListTile(
//       title: Text(exam, style: TextStyle(fontSize: size.width * 0.045)),
//       subtitle: Text(time, style: TextStyle(fontSize: size.width * 0.035)),
//       trailing: ElevatedButton(
//         onPressed: () {},
//         style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
//         child: Text("Set Reminder", style: TextStyle(fontSize: size.width * 0.035)),
//       ),
//     );
//   }

//   Widget _buildCourseCard(String course, String description, Size size) {
//     return Card(
//       child: ListTile(
//         title: Text(course, style: TextStyle(fontSize: size.width * 0.045)),
//         subtitle: Text(description, style: TextStyle(fontSize: size.width * 0.035)),
//         trailing: ElevatedButton(
//           onPressed: () {},
//           style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
//           child: Text("Explore", style: TextStyle(fontSize: size.width * 0.035)),
//         ),
//       ),
//     );
//   }

//     Widget _buildCourseCard1(String course, String description, Size size) {
//     return Card(
//       child: ListTile(
//         title: Text(course, style: TextStyle(fontSize: size.width * 0.045)),
//         subtitle: Text(description, style: TextStyle(fontSize: size.width * 0.035)),
//         trailing: ElevatedButton(
//           onPressed: () {},
//           style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
//           child: Text("Set Reminder", style: TextStyle(fontSize: size.width * 0.035)),
//         ),
//       ),
//     );
//   }

//   Widget _buildTestimonial(String name, double rating, String comment, Size size) {
//     return ListTile(
//       leading: CircleAvatar(backgroundImage: AssetImage('assets/auth/profile.jpg')),
//       title: Text(name, style: TextStyle(fontSize: size.width * 0.045)),
//       subtitle: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: List.generate(
//               5,
//               (index) => Icon(
//                 index < rating ? Icons.star : Icons.star_border,
//                 color: Colors.amber,
//                 size: size.width * 0.04,
//               ),
//             ),
//           ),
//           Text(comment, style: TextStyle(fontSize: size.width * 0.035)),
//         ],
//       ),
//     );
//   }


// class TestScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text("Tests Screen"));
//   }
// }

// class AnalyticsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text("Analytics Screen"));
//   }
// }

// class CoursesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text("Courses Screen"));
//   }
// }

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text("Profile Screen"));
//   }
// }



//   Widget _buildOrderTile(
//       IconData icon, String label, Color backgroundColor, Color iconColor) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         CircleAvatar(
//           radius: 20, // Reduced size
//           backgroundColor: backgroundColor,
//           child: Icon(
//             icon,
//             color: iconColor,
//             size: 16, // Reduced size
//           ),
//         ),
//         SizedBox(height: 4),
//         Text(
//           label,
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 10), // Adjusted font size
//         ),
//       ],
//     );
//   }
