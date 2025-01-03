import 'package:flutter/material.dart';
import 'package:mock_exam/Exams/examPaper.dart';
import 'package:mock_exam/Exams/tallyAnswer.dart';



class ExamScreen extends StatefulWidget {
  const ExamScreen({Key? key}) : super(key: key);

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> allSets = [
    'Nepal Rastra Bank Set -30',
    'Nasu + Kharidar Set -44',
    'TSC First Paper -31',
    'Banking Pretest -49',
    'Nasu + Kharidar Set -43',
    'TSC First Paper -30',
    'Banking Pretest -48',
    'Nasu + Kharidar Set -42',
  ];
  List<String> filteredSets = [];
  List<String> suggestions = [];

  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      suggestions = allSets
          .where((set) => set.toLowerCase().contains(query))
          .take(4)
          .toList();
    });
  }

  void _onSuggestionSelected(String suggestion) {
    setState(() {
      _searchController.text = suggestion;
      filteredSets = allSets
          .where((set) => set.toLowerCase().contains(suggestion.toLowerCase()))
          .toList();
      suggestions = [];
    });
  }

void showSubmitDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Congratulations!'),
        content: const Text('Your paper is submitted.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);

            },
            child: const Text('Go To Home'),
          ),
          TextButton(
            onPressed: () {
             // tallyAnswers();
             Navigator.push(context, MaterialPageRoute(builder: (context) => TallyAnswerScreen()));
            },
            child: const Text('Tally Answers'),
          ),
        ],
      ),
    );
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      filteredSets = [];
      suggestions = [];
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Online Exams',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: const Icon(Icons.home),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                    height: 50,
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                      hintText: 'Search LokSewa exams...',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: _clearSearch,
                          )
                        : null,
                      ),
                    ),
                    ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (suggestions.isNotEmpty)
                Center(
                  child: Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: suggestions.map((suggestion) {
                    return GestureDetector(
                      onTap: () => _onSuggestionSelected(suggestion),
                      child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        suggestion,
                        style: const TextStyle(color: Colors.black),
                      ),
                      ),
                    );
                    }).toList(),
                  ),
                  ),
                ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredSets.isNotEmpty
                    ? filteredSets.length
                    : allSets.length,
                itemBuilder: (context, index) {
                  final set = filteredSets.isNotEmpty
                      ? filteredSets[index]
                      : allSets[index];
                  return Card(
                    child: ListTile(
                      title: Text(set),
                      subtitle: Text(
                          '${index % 2 == 0 ? 18 : 20} Questions  ·  ${index % 2 == 0 ? 10 : 15} minutes'),
                        trailing: ElevatedButton(
                        onPressed: () {
                          showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Start Exam'),
                            content: const Text('Are you sure you want to start the exam?'),
                            actions: [
                            TextButton(
                              onPressed: () {
                              Navigator.of(context).pop();
                              },
                              child: const Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MockExamScreen()),
                              );
                              },
                              child: const Text('Yes'),
                            ),
                            ],
                          ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                        ),
                        child: const Text('Start Exam'),
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
