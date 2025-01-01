// import 'package:flutter/material.dart';

// class TallyAnswersPage extends StatelessWidget {
//   const TallyAnswersPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tally Answers'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Result Code Section
//             Center(
//               child: Column(
//                 children: [
//                   const Text(
//                     'Your Result Code:',
//                     style: TextStyle(fontSize: 16, color: Colors.grey),
//                   ),
//                   Text(
//                     'ABC123XYZ',
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             // Score Summary Section
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 _buildScoreCard('Questions', '10', Colors.black),
//                 _buildScoreCard('Correct', '7', Colors.green),
//                 _buildScoreCard('Wrong', '3', Colors.red),
//               ],
//             ),
//             const SizedBox(height: 20),
//             // Question List Section
//             Expanded(
//               child: ListView(
//                 children: [
//                   _buildQuestionRow(1, 'What is the capital of France?', 'Paris', 'Paris', true),
//                   _buildQuestionRow(2, 'Which planet is known as the Red Planet?', 'Mars', 'Mars', true),
//                   _buildQuestionRow(3, 'What is the chemical symbol for gold?', 'Au', 'Ag', false),
//                   _buildQuestionRow(4, 'Who painted the Mona Lisa?', 'Leonardo da Vinci', 'Leonardo da Vinci', true),
//                   _buildQuestionRow(5, 'What is the largest ocean on Earth?', 'Pacific Ocean', 'Pacific Ocean', true),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),
//             // Buttons Section
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     // Share Result Logic
//                   },
//                   icon: const Icon(Icons.share),
//                   label: const Text('Share Result'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple,
//                   ),
//                 ),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     // Export Results Logic
//                   },
//                   icon: const Icon(Icons.download),
//                   label: const Text('Export Results'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildScoreCard(String label, String value, Color valueColor) {
//     return Column(
//       children: [
//         Text(
//           label,
//           style: const TextStyle(fontSize: 16, color: Colors.grey),
//         ),
//         Text(
//           value,
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: valueColor,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildQuestionRow(
//     int questionNumber,
//     String question,
//     String correctAnswer,
//     String userAnswer,
//     bool isCorrect,
//   ) {
//     return Container(
//       padding: const EdgeInsets.all(8.0),
//       margin: const EdgeInsets.symmetric(vertical: 4.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: Colors.grey.shade300),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 1,
//             child: Text('$questionNumber', style: const TextStyle(fontSize: 14)),
//           ),
//           Expanded(
//             flex: 3,
//             child: Text(question, style: const TextStyle(fontSize: 14)),
//           ),
//           Expanded(
//             flex: 2,
//             child: Text(correctAnswer, style: const TextStyle(fontSize: 14)),
//           ),
//           Expanded(
//             flex: 2,
//             child: Text(userAnswer, style: const TextStyle(fontSize: 14)),
//           ),
//           Expanded(
//             flex: 1,
//             child: Icon(
//               isCorrect ? Icons.check_circle : Icons.cancel,
//               color: isCorrect ? Colors.green : Colors.red,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';

// class TallyAnswerScreen extends StatelessWidget {
//   final int totalQuestions = 4;
//   final int correctAnswers = 3;
//   final int wrongAnswers = 1;
//   final List<Map<String, String>> questions = [
//     {
//       'question': '1. If RAMESH is coded as HSEMAR, then CREATE would be coded as:',
//       'correctAnswer': 'ETAERC',
//       'selectedAnswer': 'ETAERC',
//     },
//     {
//       'question': '2. If EXPLAINING is coded as PYEALINGNI, then PRODUCED would be coded as:',
//       'correctAnswer': 'ORPEUDEC',
//       'selectedAnswer': 'DORPDECU',
//     },
//     {
//       'question': '3. Which of the following images support the Human life?',
//       'correctAnswer': 'Earth',
//       'selectedAnswer': 'Earth',
//     },
//     {
//       'question': '4. Listen to the following audio clips and identify the correct coding pattern:',
//       'correctAnswer': 'Option B',
//       'selectedAnswer': 'Option B',
//     },
//   ];

 

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tally Answers'),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Result Summary',
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.deepPurple,
//               ),
//             ),
//             const SizedBox(height: 10),
//             buildSummaryRow('Total Questions:', totalQuestions.toString()),
//             buildSummaryRow('Correct Answers:', correctAnswers.toString()),
//             buildSummaryRow('Wrong Answers:', wrongAnswers.toString()),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: questions.length,
//                 itemBuilder: (context, index) {
//                   final question = questions[index];
//                   final isCorrect =
//                       question['correctAnswer'] == question['selectedAnswer'];

//                   return Card(
//                     elevation: 4,
//                     margin: const EdgeInsets.symmetric(vertical: 8),
//                     child: Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             question['question']!,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Row(
//                             children: [
//                               const Text('Your Answer: '),
//                               Text(
//                                 question['selectedAnswer']!,
//                                 style: TextStyle(
//                                   color: isCorrect ? Colors.green : Colors.red,
//                                 ),
//                               ),
//                               const SizedBox(width: 8),
//                               Icon(
//                                 isCorrect ? Icons.check_circle : Icons.cancel,
//                                 color: isCorrect ? Colors.green : Colors.red,
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               const Text('Correct Answer: '),
//                               Text(
//                                 question['correctAnswer']!,
//                                 style: const TextStyle(color: Colors.green),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     Share.share(
//                         'I scored $correctAnswers out of $totalQuestions in the Mock Exam!');
//                   },
//                   icon: const Icon(Icons.share),
//                   label: const Text('Share Result'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.deepPurple,
//                   ),
//                 ),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     // Export functionality goes here
//                   },
//                   icon: const Icon(Icons.download),
//                   label: const Text('Export Result'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.deepPurple,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildSummaryRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           Text(
//             value,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.deepPurple,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class TallyAnswerScreen extends StatelessWidget {
  final int totalQuestions = 4;
  final int correctAnswers = 3;
  final int wrongAnswers = 1;
  final List<Map<String, String>> questions = [
    {
      'question': '1. If RAMESH is coded as HSEMAR, then CREATE would be coded as:',
      'correctAnswer': 'ETAERC',
      'selectedAnswer': 'ETAERC',
    },
    {
      'question': '2. If EXPLAINING is coded as PYEALINGNI, then PRODUCED would be coded as:',
      'correctAnswer': 'ORPEUDEC',
      'selectedAnswer': 'DORPDECU',
    },
    {
      'question': '3. Which of the following images support the Human life?',
      'correctAnswer': 'Earth',
      'selectedAnswer': 'Earth',
    },
    {
      'question': '4. Listen to the following audio clips and identify the correct coding pattern:',
      'correctAnswer': 'Option B',
      'selectedAnswer': 'Option B',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tally Answers', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
        Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Your Result Code: ABC123XYZ',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  buildSummaryRow('Total   Questions:', totalQuestions.toString()),
                  buildSummaryRow('Correct Answers:', correctAnswers.toString()),
                  buildSummaryRow('Wrong   Answers:', wrongAnswers.toString()),
                  const SizedBox(height: 3),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      final question = questions[index];
                      final isCorrect =
                          question['correctAnswer'] == question['selectedAnswer'];

                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                question['question']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Text('Your Answer: '),
                                  Text(
                                    question['selectedAnswer']!,
                                    style: TextStyle(
                                      color: isCorrect ? Colors.green : Colors.red,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Icon(
                                    isCorrect ? Icons.check_circle : Icons.cancel,
                                    color: isCorrect ? Colors.green : Colors.red,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('Correct Answer: '),
                                  Text(
                                    question['correctAnswer']!,
                                    style: const TextStyle(color: Colors.green),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Share.share(
                      'I scored $correctAnswers out of $totalQuestions in the Mock Exam!');
                },
                icon: const Icon(Icons.share),
                label: const Text('Share Result'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Export functionality goes here
                },
                icon: const Icon(Icons.download),
                label: const Text('Export Result'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 60,),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(width: 50,),
        ],
      ),
    );
  }
}


















