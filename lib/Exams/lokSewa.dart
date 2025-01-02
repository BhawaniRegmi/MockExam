// import 'package:flutter/material.dart';
// import 'package:mock_exam/Exams/examSets.dart';
// class LokSewaApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LokSewaExamsPage(),
//     );
//   }
// }
// late BuildContext ctx;

// class LokSewaExamsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     ctx = context;
//     return Scaffold(
//       appBar: AppBar(
//       title: Text('LokSewa Exams', style: TextStyle(color: Colors.black)),
//       backgroundColor: Colors.white,
//       leading: Icon(Icons.home, color: Colors.black),
//       actions: [
//         IconButton(
//         icon: Icon(Icons.notifications, color: Colors.black),
//         onPressed: () {},
//         ),
//       ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             // SizedBox(
//             //   height: 50,
//             //   child: TextField(
//             //   decoration: InputDecoration(
//             //     hintText: 'Search LokSewa exams...',
//             //     prefixIcon: Icon(Icons.search),
//             //     border: OutlineInputBorder(
//             //     borderRadius: BorderRadius.circular(8),
//             //     ),
//             //   ),
//             //   ),
//             // ),
//             // SizedBox(height: 16),
//             ..._buildExamSetCards(),
//             SizedBox(height: 24),
//             Text(
//               'Previous Exams',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16),
//             ..._buildPreviousExams(),
//           ],
//         ),
//       ),
//     );
//   }

//   List<Widget> _buildExamSetCards() {
//     final exams = [
//       {'title': 'Adhikrit', 'sets': 113, 'color': Colors.grey},
//       {'title': 'Subba', 'sets': 130, 'color': Colors.orange},
//       {'title': 'Kharidar', 'sets': 123, 'color': Colors.grey},
//     ];

//     return exams.map((exam) {
//       return Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         color: exam['color'] == Colors.grey ? Colors.blue[100] : Colors.orange[100],
//         child: ListTile(
//           leading: Image.asset('assets/auth/lokSewa.jpeg', width: 50, height: 50),
//           title: Text(
//         exam['title'] as String,
//         style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
//           ),
//           subtitle: Text(
//         '${exam['sets']} Sets',
//         style: TextStyle(color: Colors.black54),
//           ),
//           trailing: ElevatedButton(
//         onPressed: () {
//           Navigator.push(ctx, MaterialPageRoute(builder: (context) => ExamScreen()));
//         },
//         style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
//         child: Text('View Sets'),
//           ),
//         ),
//       );
//     }).toList();
//   }

//   List<Widget> _buildPreviousExams() {
//     final previousExams = [
//       {'title': 'Adhikrit Set 27', 'score': 85, 'date': 'Oct 15, 2023'},
//       {'title': 'Subba Set 35', 'score': 92, 'date': 'Oct 10, 2023'},
//       {'title': 'Kharidar Set 57', 'score': 78, 'date': 'Oct 5, 2023'},
//     ];

//     return previousExams.map((exam) {
//       return Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 exam['title'] as String,
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 4),
//               Text('Completed on ${exam['date']}'),
//               SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: LinearProgressIndicator(
//                       value: (exam['score'] as int) / 100,
//                       backgroundColor: Colors.grey[300],
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(width: 16),
//                   Text(
//                     '${exam['score']}%',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8),
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
//                 child: Text('Retake Exam'),
//               ),
//             ],
//           ),
//         ),
//       );
//     }).toList();
//   }
// }




import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LokSewaExamScreen(),
  ));
}

class LokSewaExamScreen extends StatefulWidget {
  @override
  _LokSewaExamScreenState createState() => _LokSewaExamScreenState();
}

class _LokSewaExamScreenState extends State<LokSewaExamScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _categories = ['Adhikrit', 'Subba', 'Kharidar'];
  List<String> _filteredCategories = [];
  String? _selectedSuggestion;

  @override
  void initState() {
    super.initState();
    _filteredCategories = _categories;
  }

  void _filterCategories(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredCategories = _categories;
        _selectedSuggestion = null;
      } else {
        _filteredCategories = _categories
            .where((category) => category.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _filteredCategories = _categories;
      _selectedSuggestion = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LokSewa Exams'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search LokSewa exams...',
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: _clearSearch,
                            )
                          : null,
                    ),
                    onChanged: _filterCategories,
                  ),
                ),
              ],
            ),
            if (_searchController.text.isNotEmpty)
              Wrap(
                spacing: 8.0,
                children: _filteredCategories
                    .map(
                      (category) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedSuggestion = category;
                            _searchController.text = category;
                          });
                        },
                        child: Chip(label: Text(category)),
                      ),
                    )
                    .toList(),
              ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _selectedSuggestion == null ? _categories.length : 1,
                itemBuilder: (context, index) {
                  final category = _selectedSuggestion == null
                      ? _categories[index]
                      : _selectedSuggestion!;
                  return Card(
                    margin: EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      title: Text(category),
                      subtitle: Text('${category == 'Adhikrit' ? '113' : category == 'Subba' ? '130' : '123'} Sets'),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        child: Text('View Sets'),
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
