import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          children: [
        const Icon(Icons.home, color: Colors.black),
        const SizedBox(width: 10),
       Center(child: Text("             Analytics ", style: TextStyle(color: Colors.black))),
          ],
        ),
        actions: [
          IconButton(
        icon: const Icon(Icons.more_vert, color: Colors.black),
        onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Target Scores',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
              children: [
                _buildTargetCard('History Target', '87'),
                const SizedBox(width: 10),
                _buildTargetCard('G.K. Target', '90'),
                const SizedBox(width: 10),
                _buildTargetCard('Math Target', '95'),
                const SizedBox(width: 10),
                _buildTargetCard('Overall Target', '92'),
              ],
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Update Targets'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _buildStatisticCard('Average Grade', '92.5%', '+2.3%'),
                const SizedBox(width: 10),
                _buildStatisticCard('Attendance', '98.2%', '+0.5%'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Courses Completed',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildCourseCard('History', 'Advanced', '95%', 'A+'),
                const SizedBox(width: 10),
                _buildCourseCard('Geography', 'Advanced', '88%', 'A'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Recent Tests',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // const SizedBox(height: 8),
            // TextField(
            //   decoration: InputDecoration(
            //     hintText: 'Search by exam or test',
            //     prefixIcon: const Icon(Icons.search),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 10),
            _buildTestTile('Kharidar set 5', 'Dec 15, 2023', '95/100'),
            _buildTestTile('Kharidar set 10', 'Dec 12, 2023', '88/100'),
            _buildTestTile('Kharidar set 13', 'Dec 10, 2023', '92/100'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                  label: const Text('Share Report'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                  label: const Text('Export Report'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }

  Widget _buildTargetCard(String title, String value) {
    return Card(
      elevation: 2,
      child: Container(
        width: 80,
        height: 70,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              value,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticCard(String title, String value, String change) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 10),
              Text(
                value,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                change,
                style: const TextStyle(fontSize: 12, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCourseCard(
      String title, String level, String progress, String grade) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(level, style: const TextStyle(fontSize: 12)),
              const SizedBox(height: 5),
              LinearProgressIndicator(
                value: double.parse(progress.replaceFirst('%', '')) / 100,
                backgroundColor: Colors.grey[300],
                color: Colors.purple,
              ),
              const SizedBox(height: 5),
              Text('Grade: $grade', style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTestTile(String name, String date, String score) {
    return ListTile(
      title: Text(name),
      subtitle: Text(date),
      trailing: Text(
        score,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

