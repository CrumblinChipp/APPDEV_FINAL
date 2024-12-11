import 'package:appdev_test1/BodyDataForm.dart';
import 'package:flutter/material.dart';

class AboutYouPage extends StatelessWidget {
  const AboutYouPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40), // Top padding

            const Center(
              child: Column(
                children:[
                  Icon(Icons.fitness_center, size: 48, color: Colors.black),
                  SizedBox(height: 8),
                  Text(
                    'ABOUT YOU',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Gender Section
            const Text(
              'What is your GENDER?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconButton(Icons.male, 'Male', Colors.blue),
                _buildIconButton(Icons.female, 'Female', Colors.pink),
              ],
            ),
            const SizedBox(height: 32),

            // Birthday Section
            const Text(
              'What is your Birthday?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInputField('Month'),
                _buildInputField('Day'),
                _buildInputField('Year'),
              ],
            ),
            const SizedBox(height: 32),

            // Workout Level Section
            const Text(
              'CHOOSE YOUR PREFERRED LEVEL OF WORKOUTS',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                _buildWorkoutButton('EASY ENOUGH', Colors.green),
                const SizedBox(height: 8),
                _buildWorkoutButton('SIMPLE BUT SWEATY', Colors.orange),
                const SizedBox(height: 8),
                _buildWorkoutButton('CHALLENGING', Colors.red),
              ],
            ),
            const Spacer(),

            // Navigation Button
            Align(
              alignment: Alignment.centerRight,
              child: FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BodyDataForm()),
                  );
                },
                child: const Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Method: Gender Icon Button
  static Widget _buildIconButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        Icon(icon, size: 48, color: color),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // Helper Method: Input Field
  static Widget _buildInputField(String placeholder) {
    return Expanded(
      child: TextField(
        
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: placeholder,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
        ),
      ),
    );
  }

  // Helper Method: Workout Level Button
Widget _buildWorkoutButton(String label, Color color) {
  bool _isPressed = false;

  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _isPressed ? Colors.white : color, // Change background on press
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: _isPressed ? color : Colors.transparent, // Border color when pressed
              width: 2.0, // Set border width (optional)
            ),
          ),
        ),
        onPressed: () {
          setState(() {
            _isPressed = !_isPressed; 
          });
        },
        child: Text(
          label,
          style: TextStyle(
            color: _isPressed ? Colors.black : Colors.white, // Change text color when pressed
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    },
  );
}
}