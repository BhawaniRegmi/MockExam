// import 'package:flutter/material.dart';

// class ExamSearchScreen extends StatefulWidget {
//   @override
//   _ExamSearchScreenState createState() => _ExamSearchScreenState();
// }

// class _ExamSearchScreenState extends State<ExamSearchScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   final List<String> exams = [
//     'IELTS',
//     'LokSewa',
//     'GRE',
//     'GMAT',
//     'Bridge Course',
//     'PTE',
//     'TOEFL',
//   ];
//   List<String> filteredExams = [];
//   List<String> suggestions = [];
//   String selectedSuggestion = '';

//   void _updateSuggestions(String query) {
//     if (query.isEmpty) {
//       setState(() {
//         suggestions = [];
//         filteredExams = [];
//       });
//       return;
//     }
//     setState(() {
//       suggestions = exams
//           .where((exam) => exam.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   void _applyFilter(String suggestion) {
//     setState(() {
//       selectedSuggestion = suggestion;
//       filteredExams = exams
//           .where((exam) => exam.toLowerCase().contains(suggestion.toLowerCase()))
//           .toList();
//       suggestions = [];
//       _searchController.text = suggestion;
//     });
//   }

//   void _clearSearch() {
//     setState(() {
//       _searchController.clear();
//       suggestions = [];
//       filteredExams = [];
//       selectedSuggestion = '';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: const Text('Exams', style: TextStyle(color: Colors.black))),
//         backgroundColor: Colors.white,
//         leading: IconButton(
//             icon: Icon(Icons.home, color: Colors.black),
//             onPressed: () {
//               // Notification action
//             },
//           ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications, color: Colors.black),
//             onPressed: () {
//               // Notification action
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Search bar
//             Container(
//               height: 50,
//               child: TextField(
//               controller: _searchController,
//               onChanged: _updateSuggestions,
//               decoration: InputDecoration(
//                 hintText: 'Search exams...',
//                 prefixIcon: Icon(Icons.search),
//                 suffixIcon: selectedSuggestion.isNotEmpty || _searchController.text.isNotEmpty
//                   ? IconButton(
//                     icon: Icon(Icons.clear),
//                     onPressed: _clearSearch,
//                   )
//                   : null,
//                 border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//               ),
//             ),
//             // Suggestions list
//             if (suggestions.isNotEmpty)
//               ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: suggestions.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(suggestions[index]),
//                     onTap: () => _applyFilter(suggestions[index]),
//                   );
//                 },
//               ),
//             SizedBox(height: 10),
//             // Filtered exams
//             Expanded(
//               child: filteredExams.isNotEmpty
//                   ? GridView.builder(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         childAspectRatio: 3 / 2,
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 10,
//                       ),
//                       itemCount: filteredExams.length,
//                       itemBuilder: (context, index) {
//                         return Card(
//                           elevation: 4,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 filteredExams[index],
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                               SizedBox(height: 8),
//                               ElevatedButton(
//                                 onPressed: () {

//                                 },
//                                 child: Text('Get Started'),
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.purple,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     )
//                   : exams.isNotEmpty
//                       ? GridView.builder(
//                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             childAspectRatio: 3 / 2,
//                             crossAxisSpacing: 10,
//                             mainAxisSpacing: 10,
//                           ),
//                           itemCount: exams.length,
//                           itemBuilder: (context, index) {
//                             return Card(
//                               elevation: 4,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     exams[index],
//                                     style: TextStyle(fontSize: 16),
//                                   ),
//                                   SizedBox(height: 8),
//                                   ElevatedButton(
//                                     onPressed: () {},
//                                     child: Text('Get Started'),
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.purple,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         )
//                       : Center(child: Text('No exams available')),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:mock_exam/Exams/lokSewa.dart';

class ExamSearchScreen extends StatefulWidget {
  @override
  _ExamSearchScreenState createState() => _ExamSearchScreenState();
}

class _ExamSearchScreenState extends State<ExamSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> exams = [
    'IELTS',
    'LokSewa',
    'GRE',
    'GMAT',
    'Bridge Course',
    'PTE',
    'TOEFL',
  ];
    final List<String> paths = [
      'ielts.png',
    'lokSewa.jpeg',
    'gre.png',
    'korean.png',
    'ielts.png',
    'gre.png',
    'korean.png',
   
  ];

  // Define actions for each exam
  final Map<String, VoidCallback> examActions = {};

  List<String> filteredExams = [];
  List<String> suggestions = [];
  String selectedSuggestion = '';

  @override
  void initState() {
    super.initState();

    // Initialize exam actions
    examActions.addAll({
      'IELTS': () => _navigateToDetails('IELTS Exam Details'),
      'LokSewa': () => Navigator.push(context, MaterialPageRoute(builder: (context) => LokSewaExamScreen())),
      'GRE': () => _navigateToDetails('GRE Preparation Guide'),
      'GMAT': () => _navigateToDetails('GMAT Tips and Tricks'),
      'Bridge Course': () => _navigateToDetails('Bridge Course Details'),
      'PTE': () => _navigateToDetails('PTE Exam Strategy'),
      'TOEFL': () => _navigateToDetails('TOEFL Study Materials'),
    });
  }

  void _navigateToDetails(String details) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Exam Details'),
          content: Text(details),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _updateSuggestions(String query) {
    // if (query.length < 2) {
    //   setState(() {
    //     suggestions = [];
    //     filteredExams = [];
    //   });
    //   return;
    // }
    setState(() {
      suggestions = exams
          .where((exam) => exam.toLowerCase().contains(query.toLowerCase()))
          .take(3)
          .toList();
    });
  }

  void _applyFilter(String suggestion) {
    setState(() {
      selectedSuggestion = suggestion;
      filteredExams = exams
          .where((exam) => exam.toLowerCase().contains(suggestion.toLowerCase()))
          .toList();
      suggestions = [];
      _searchController.text = suggestion;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      suggestions = [];
      filteredExams = [];
      selectedSuggestion = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: const Text('Exams', style: TextStyle(color: Colors.black))),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.home, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            Container(
              height: 50,
              child: TextField(
                controller: _searchController,
                onChanged: _updateSuggestions,
                decoration: InputDecoration(
                  hintText: 'Search exams...',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: selectedSuggestion.isNotEmpty ||
                          _searchController.text.isNotEmpty
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
            // Suggestions list
            if (suggestions.isNotEmpty)
                  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  // child: ListView.builder(
                  //   shrinkWrap: true,
                  //   itemCount: suggestions.length,
                  //   itemBuilder: (context, index) {
                  //   return ListTile(
                  //     title: Text(suggestions[index]),
                  //     onTap: () => _applyFilter(suggestions[index]),
                  //   );
                  //   },
                  // ),
                  child: ListView.builder(
  shrinkWrap: true,
  itemCount: suggestions.length,
  itemBuilder: (context, index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: GestureDetector(
          onTap: () => _applyFilter(suggestions[index]),
          child: Text(
            suggestions[index],
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  },
),
                  ),
            SizedBox(height: 10),
            // Filtered exams
            Expanded(
              child: filteredExams.isNotEmpty
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                       childAspectRatio: .91,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: filteredExams.length,
                      itemBuilder: (context, index) {
                        final exam = filteredExams[index];
                        final path = paths[exams.indexOf(exam)];
                        return Card(
                              elevation: 4,
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Add image
                                Image.asset(
                                'assets/auth/$path',
                                height: 80,
                                width: 100,
                                fit: BoxFit.cover,
                                ),
                                SizedBox(height: 4),
                                Text(
                                exam,
                                style: TextStyle(fontSize: 16),
                                ),
                               // SizedBox(height: 2),
                                ElevatedButton(
                                onPressed: examActions[exam],
                                child: Text('Get Started'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple,
                                ),
                                ),
                              ],
                              ),
                            );
                      },
                    )
                  : exams.isNotEmpty
                      ? GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            // childAspectRatio: 3 / 2,
                            childAspectRatio: .91,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: exams.length,
                          itemBuilder: (context, index) {
                            final exam = exams[index];
                            final path = paths[index];
                            return Card(
                              elevation: 4,
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Add image
                                Image.asset(
                                'assets/auth/$path',
                                height: 80,
                                width: 90,
                                fit: BoxFit.cover,
                                ),
                                SizedBox(height: 4),
                                Text(
                                exam,
                                style: TextStyle(fontSize: 16),
                                ),
                               // SizedBox(height: 2),
                                ElevatedButton(
                                onPressed: examActions[exam],
                                child: Text('Get Started'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple,
                                ),
                                ),
                              ],
                              ),
                            );
                          },
                        )
                      : Center(child: Text('No exams available')),
            ),
          ],
        ),
      ),
    );
  }
}
