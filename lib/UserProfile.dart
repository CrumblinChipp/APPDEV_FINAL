import 'package:appdev_test1/WorkoutDashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For SystemNavigator

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
      ),
      drawer: Drawer(
        
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Exit'),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 1, 177, 159), Colors.grey],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.person, size: 60, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                'Russell Marcelo',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Weekly Progress Section
              const Text(
                'WEEKLY PROGRESS',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 130,
                  child: Row(
                    children: List.generate(7, (index) {
                      final days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
                      final heights = [60.0, 85.0, 100.0, 78.0, 70.0, 40.0, 20.0];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 15,
                              height: heights[index],
                              color: Colors.lightBlue,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              days[index],
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
              const Divider(height: 40, thickness: 1, color: Colors.grey),

              // Daily Workout Section
              const Text(
                'DAILY WORKOUT',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        WorkoutItem(
                          title: 'PUSH-UP',
                          difficulty: 'EASY, UPPER BODY',
                          color: Colors.green[100]!,
                        ),
                        WorkoutItem(
                          title: 'PULL-UP',
                          difficulty: 'MEDIUM, UPPER BODY',
                          color: Colors.orange[100]!,
                        ),
                        WorkoutItem(
                          title: 'BENCH PRESS',
                          difficulty: 'HARD, UPPER BODY',
                          color: Colors.red[100]!,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WorkoutDashboard(),
                            ),
                          );
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.grey[300],
                                value: 0.0,
                                color: Colors.blue,
                                strokeWidth: 6,
                              ),
                            ),
                            const Text(
                              '0.0%',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkoutItem extends StatelessWidget {
  final String title;
  final String difficulty;
  final Color color;

  const WorkoutItem({
    Key? key,
    required this.title,
    required this.difficulty,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  difficulty,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            const Icon(Icons.fitness_center, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
