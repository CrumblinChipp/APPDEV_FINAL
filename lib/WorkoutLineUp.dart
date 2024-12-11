import 'UserProfile.dart';
import 'package:flutter/material.dart';

class WorkoutLineUp extends StatelessWidget {
  const WorkoutLineUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock data for workouts
    final workouts = [
      {'title': 'PUSH-UP', 'difficulty': 'EASY ENOUGH', 'type': 'UPPER BODY'},
      {'title': 'SQUATS', 'difficulty': 'EASY ENOUGH', 'type': 'LOWER BODY'},
      {'title': 'PLANK', 'difficulty': 'EASY ENOUGH', 'type': 'UPPER BODY'},
      {'title': 'JUMPING JACK', 'difficulty': 'EASY ENOUGH', 'type': 'WHOLE BODY'},
      {'title': 'CURL-UP', 'difficulty': 'EASY ENOUGH', 'type': 'UPPER BODY'},
      {'title': 'PULL-UP', 'difficulty': 'SIMPLE BUT SWEATY', 'type': 'UPPER BODY'},
      {'title': 'BENCH PRESS', 'difficulty': 'CHALLENGING', 'type': 'UPPER BODY'},
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'WORKOUT LINE UP',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: workouts.length,
                itemBuilder: (context, index) {
                  final workout = workouts[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.pink[100],
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const Center(
                                  child: Icon(Icons.fitness_center, color: Colors.white),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    workout['title']!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    workout['difficulty']!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: workout['difficulty'] == 'EASY ENOUGH'
                                          ? Colors.green
                                          : workout['difficulty'] == 'SIMPLE BUT SWEATY'
                                              ? Colors.orange
                                              : workout['difficulty'] == 'CHALLENGING'
                                                  ? Colors.red
                                                  : null, 
                                    ),
                                  ),  
                                  Text(
                                    workout['type']!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.add_circle_outline, color: Colors.pink),
                              ),
                              const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserProfile()),
                    );
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.teal,
              ),
              child: const Icon(Icons.arrow_forward, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
