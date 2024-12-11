import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'PUSH - UP',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.arrow_back,
                color: Colors.blue,
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Tags Row
          Row(
            children: [
              _buildTag('EASY ENOUGH', Colors.green),
              const SizedBox(width: 8),
              _buildTag('UPPER BODY', Colors.blue),
            ],
          ),
          const SizedBox(height: 16),

          // Illustration and Statistics
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/push_up_illustration.png', // Replace with your image asset path
                  height: 100,
                ),
              ),
              const VerticalDivider(color: Colors.grey, thickness: 1),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'STATISTICS',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Image.asset(
                      'assets/statistics_chart.png', // Replace with your stats chart asset path
                      height: 100,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // How to do it properly section
          const Text(
            'HOW TO DO IT PROPERLY',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'STEP 1: Begin in a high plank position with hands shoulder-width apart and feet together.\n'
            'STEP 2: Engage your core, keeping your body in a straight line from head to heels.\n'
            'STEP 3: Lower your body until your chest nearly touches the floor, keeping elbows at about a 45-degree angle.\n'
            'STEP 4: Push back up to the starting position.',
            style: TextStyle(height: 1.5),
          ),
          const SizedBox(height: 16),

          // Information Section
          const Text(
            'INFORMATION',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'A push-up is a body weight exercise that strengthens the chest, shoulders, triceps, and core by lowering and lifting your body while maintaining a straight posture. It improves upper body endurance and enhances core stability.',
            style: TextStyle(height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
