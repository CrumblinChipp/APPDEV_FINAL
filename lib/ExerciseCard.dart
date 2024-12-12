import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Icon Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'PUSH-UP',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);

                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Tags Row
            Row(
              children: [
                _buildTag('EASY ENOUGH', Colors.green),
                const SizedBox(width: 8),
                _buildTag('UPPER BODY', Colors.blue),
              ],
            ),
            const SizedBox(height: 16),
            // How to do it section
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
