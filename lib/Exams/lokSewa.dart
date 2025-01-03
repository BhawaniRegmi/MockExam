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
import 'package:mock_exam/Exams/examSets.dart';



class LokSewaScreen extends StatefulWidget {
  @override
  _LokSewaScreenState createState() => _LokSewaScreenState();
}

class _LokSewaScreenState extends State<LokSewaScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> allItems = ['Adhikrit', 'Subba', 'Kharidar'];
  List<String> filteredItems = [];
  List<String> suggestions = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _filterSuggestions(_searchController.text);
    });
  }

  void _filterSuggestions(String query) {
    if (query.isEmpty) {
      setState(() {
        suggestions.clear();
        filteredItems.clear();
      });
    } else {
      setState(() {
        suggestions = allItems
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  void _filterList(String selectedSuggestion) {
    setState(() {
      filteredItems = allItems
          .where((item) =>
              item.toLowerCase() == selectedSuggestion.toLowerCase())
          .toList();
      suggestions.clear();
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      filteredItems.clear();
      suggestions.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LokSewa Exams', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        leading: const Icon(Icons.home, color: Colors.black),
        actions: [
          IconButton(
        icon: const Icon(Icons.notifications, color: Colors.black),
        onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
            Padding(
              // padding: const EdgeInsets.all(16.0),
               padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
              child: Row(
              children: [
                Expanded(
                child: SizedBox(
                  height: 50,
                  child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search LokSewa exams...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: _clearSearch,
                      )
                      : null,
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  ),
                ),
                ),
              ],
              ),
            ),
          if (suggestions.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                children: suggestions
                    .map((suggestion) => GestureDetector(
                          onTap: () => _filterList(suggestion),
                          child: Chip(
                            label: Text(suggestion),
                          ),
                        ))
                    .toList(),
              ),
            ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                // padding: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredItems.isEmpty
                          ? allItems.length
                          : filteredItems.length,
                      itemBuilder: (context, index) {
                        final item = filteredItems.isEmpty
                            ? allItems[index]
                            : filteredItems[index];
                        return Card(
                          child: ListTile(
                          title: Text(item),
                          subtitle: Text('100 Sets'),
                          trailing: ElevatedButton(
                            onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ExamScreen()));
                            },
                            child: const Text('View Sets'),
                          ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Previous Exams',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Card(
                          child: Column(
                            children: [
                              ListTile(
                                title: const Text('Adhikrit Set 27'),
                                subtitle: const Text('Completed on Oct 15, 2023'),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('85%',
                                        style: TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.bold)),
                                    Text('Score'),
                                  ],
                                ),
                              ),
                           
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                                child: Text('Retake Exam'),
                              )
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              ListTile(
                                title: const Text('Subba Set 35'),
                                subtitle: const Text('Completed on Oct 10, 2023'),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('92%',
                                        style: TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.bold)),
                                    Text('Score'),
                                  ],
                                ),
                              ),
                               
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                                child: Text('Retake Exam'),
                              )
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              ListTile(
                                title: const Text('Kharidar Set 57'),
                                subtitle: const Text('Completed on Oct 5, 2023'),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('78%',
                                        style: TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.bold)),
                                    Text('Score'),
                                  ],
                                ),
                              ),
                              
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                                child: Text('Retake Exam'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
