import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mock_exam/Exams/tallyAnswer.dart';
import 'package:mock_exam/Screens/homeScreen.dart';



class MockExamScreen extends StatefulWidget {
  const MockExamScreen({super.key});

  @override
  State<MockExamScreen> createState() => _MockExamScreenState();
}

class _MockExamScreenState extends State<MockExamScreen> {
  int remainingTime = 30 * 60; // 30 minutes in seconds
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (remainingTime <= 0) {
        timer?.cancel();
        showSubmitDialog();
      } else if (remainingTime == 60) {
        // Play alert sound for the last minute
        SystemSound.play(SystemSoundType.alert);
      }
      setState(() {
        remainingTime--;
      });
    });
  }

  void showSubmitDialog() {
    setState(() {
     Navigator.push(context, MaterialPageRoute(builder: (context) => MockExamScreen()));

    });
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
  void tallyAnswers() {
    int score = 0;
    if (selectedOption1 == 'ETAERC') score++;
    if (selectedOption2 == 'ORPEUDEC') score++;
    if (selectedImageOption == 'Earth') score++;
    if (selectedAudioOption == 'Option B') score++;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Your Score'),
        content: Text('You scored $score out of 4'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  String formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  String? selectedOption1;
  String? selectedOption2;
  String? selectedImageOption;
  String? selectedAudioOption;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool shouldPop = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Warning'),
            content: const Text('Your exam will be cancelled and you will need to start again. Do you want to proceed?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // Stay on the current screen
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // Exit the screen
                  Navigator.pushReplacementNamed(context, '/newScreen'); // Navigate to the new screen
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        );
        return shouldPop ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Online Exam',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              // Implement navigation to home screen
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('Time: 30 minutes', style: TextStyle(fontSize: 12, color: Colors.black)),
                  Text('Total Marks: 40', style: TextStyle(fontSize: 12, color: Colors.black)),
                ],
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.yellow[100],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(
                          'Please read each question carefully and select the correct answer. Each question carries equal marks. No negative marking.',
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildQuestion(
                        '1. If RAMESH is coded as HSEMAR, then CREATE would be coded as:',
                        ['TEACRE', 'ETACRE', 'ETAERC', 'ETAECR'],
                        selectedOption1,
                        (value) => setState(() => selectedOption1 = value),
                      ),
                      const SizedBox(height: 16),
                      _buildQuestion(
                        '2. If EXPLAINING is coded as PYEALINGNI, then PRODUCED would be coded as:',
                        ['ORPUDDEC', 'ORPEUDEC', 'DORPDECU', 'ROPUDECD'],
                        selectedOption2,
                        (value) => setState(() => selectedOption2 = value),
                      ),
                      const SizedBox(height: 16),
                      _buildImageQuestion(
                        '3. Which of the following images support the Human life?',
                        [
                          'assets/auth/earth.jpeg',
                          'assets/auth/saturn.jpeg',
                          'assets/auth/sun.jpeg',
                          'assets/auth/mars.jpeg',
                        ],
                        ['Earth', 'Saturn', 'Sun', 'Mars'],
                        selectedImageOption,
                        (value) => setState(() => selectedImageOption = value),
                      ),
                      const SizedBox(height: 16),
                      _buildAudioQuestion(
                        '4. Listen to the following audio clips and identify the correct coding pattern:',
                        ['Option A', 'Option B', 'Option C', 'Option D'],
                        selectedAudioOption,
                        (value) => setState(() => selectedAudioOption = value),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.red[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Remaining Time: ${formatTime(remainingTime)}',
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Submit Confirmation'),
                          content: const Text('Are you sure you want to submit?'),
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
                                if (selectedOption1 == null) {
                                  // Scroll to the first question and show a snackbar
                                  Scrollable.ensureVisible(
                                    context,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeInOut,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Please answer question 1.')),
                                  );
                                  return;
                                }
                                if (selectedOption2 == null) {
                                  // Scroll to the second question and show a snackbar
                                  Scrollable.ensureVisible(
                                    context,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeInOut,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Please answer question 2.')),
                                  );
                                  return;
                                }
                                if (selectedImageOption == null) {
                                  // Scroll to the image question and show a snackbar
                                  Scrollable.ensureVisible(
                                    context,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeInOut,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Please answer question 3.')),
                                  );
                                  return;
                                }
                                if (selectedAudioOption == null) {
                                  // Scroll to the audio question and show a snackbar
                                  Scrollable.ensureVisible(
                                    context,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeInOut,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Please answer question 4.')),
                                  );
                                  return;
                                }

                                // If all questions are answered, proceed to show the submit dialog
                                showSubmitDialog();
                              },
                              child: const Text('Yes'),
                            ),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  }

  Widget _buildQuestion(String question, List<String> options, String? selectedOption, void Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        ...options.map(
          (option) => RadioListTile<String>(
            title: Text(option),
            value: option,
            groupValue: selectedOption,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildImageQuestion(String question, List<String> imagePaths, List<String> labels, String? selectedOption, void Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
        question,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        // childAspectRatio: 1,
        childAspectRatio: 0.95,
        ),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
        return Column(
          children: [
          GestureDetector(
            onTap: () => onChanged(labels[index]),
            child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(
              color: selectedOption == labels[index] ? Colors.blue : Colors.grey,
              width: 2,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Image.asset(imagePaths[index], fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 4),
          Text(labels[index]),
          Radio<String>(
            value: labels[index],
            groupValue: selectedOption,
            onChanged: onChanged,
          ),
          ],
        );
        },
      ),
      ],
    );
  }




Widget _buildAudioQuestion(
  String question,
  List<String> options,
  String? selectedOption,
  void Function(String?) onChanged,
) {
  return StatefulBuilder(
    builder: (context, setState) {
      // AudioPlayer instances for each option
      final audioPlayers = <String, AudioPlayer>{};
      final isPlaying = <String, bool>{};
      final isMuted = <String, bool>{};
      final isRecording = <String, bool>{};

      // Initialize state for each option
      for (var option in options) {
        audioPlayers.putIfAbsent(option, () => AudioPlayer());
        isPlaying.putIfAbsent(option, () => false);
        isMuted.putIfAbsent(option, () => false);
        isRecording.putIfAbsent(option, () => false);
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...options.map(
            (option) => RadioListTile<String>(
              title: Row(
                children: [
                  Text(option),
                  SizedBox(width: 20,),
                  const SizedBox(width: 10),
                  // Play/Pause Button
                  PlayPauseButton(audioPath: 'auth/smaple.mp3'),
                //  IconButton(
                //     icon: Icon(isPlaying[option]! ? Icons.pause : Icons.play_arrow),
                //     onPressed: () async {
                //       // final player = audioPlayers[option]!;
                //       final player = audioPlayers[option]!;
                      
                //       if (isPlaying[option]!) {
                //         await player.pause();
                //       } else {
                //         await player.play(AssetSource('auth/smaple.mp3'));
                //       }
                   
                //       setState(() {
                //         isPlaying[option] = !isPlaying[option]!;
                //       });
                //     },
                //   ),
                  const SizedBox(width: 10),
                  // Mute/Unmute Button
                  // IconButton(
                  //   icon: Icon(isMuted[option]! ? Icons.volume_off : Icons.volume_up),
                  //   onPressed: () {
                  //     final player = audioPlayers[option]!;
                  //     player.setVolume(isMuted[option]! ? 1.0 : 0.0);
                  //     setState(() {
                  //       isMuted[option] = !isMuted[option]!;
                  //     });
                  //   },
                  // ),
                  const SizedBox(width: 10),
                  // Mic Record/Stop Button
                  IconButton(
                    icon: Icon(isRecording[option]! ? Icons.mic_off : Icons.mic),
                    onPressed: () {
                      setState(() {
                        isRecording[option] = !isRecording[option]!;
                      });

                      if (isRecording[option]!) {
                        // Start recording (requires implementation)
                        print('Recording started for $option');
                      } else {
                        // Stop recording
                        print('Recording stopped for $option');
                      }
                    },
                  ),
                ],
              ),
              value: option,
              groupValue: selectedOption,
              onChanged: onChanged,
            ),
          ),
        ],
      );
    },
  );
}






class PlayPauseButton extends StatefulWidget {
  final String audioPath; // Path to the audio file
  const PlayPauseButton({Key? key, required this.audioPath}) : super(key: key);

  @override
  _PlayPauseButtonState createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Clean up the AudioPlayer instance
    super.dispose();
  }

  void _togglePlayPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause(); // Pause the audio
    } else {
      await _audioPlayer.play(AssetSource(widget.audioPath)); // Play the audio
    }

    setState(() {
      _isPlaying = !_isPlaying; // Update the play/pause state
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
      onPressed: _togglePlayPause,
    );
  }
}
