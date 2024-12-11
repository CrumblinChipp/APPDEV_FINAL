import 'WorkoutLineUp.dart';
import 'package:flutter/material.dart';

class BodyDataForm extends StatelessWidget {
  const BodyDataForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20), // Top padding

                // Header Section
                const Center(
                  child: Column(
                    children: [
                      Icon(Icons.fitness_center, size: 48, color: Colors.black),
                      SizedBox(height: 8),
                      Text(
                        'BODY DATA',
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

                // Height Input Section
                const Text(
                  'ENTER YOUR HEIGHT',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                _buildInputRow('Enter height', ['CM', 'FT']),
                const SizedBox(height: 32),

                // Current Weight Input Section
                const Text(
                  'ENTER YOUR CURRENT WEIGHT',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                _buildInputRow('Enter current weight', ['LBS', 'KG']),
                const SizedBox(height: 32),

                // Goal Weight Input Section
                const Text(
                  'WHAT IS YOUR GOAL WEIGHT?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                _buildInputRow('Enter goal weight', ['LBS', 'KG']),
                const SizedBox(height: 40),

                // Navigation Section
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const WorkoutLineUp()),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

Widget _buildInputRow(String placeholder, List<String> buttonLabels) {
  // Track button states inside a Map to toggle colors
  final Map<String, bool> buttonStates = {
    for (var label in buttonLabels) label: false,
  };

  return StatefulBuilder(
    builder: (context, setState) {
      return Row(
        children: [
          // Input Field
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: placeholder,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(width: 10),

          // Buttons
          Column(
            children: buttonLabels.map((label) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buttonStates[label] = !buttonStates[label]!;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonStates[label]!
                        ? const Color.fromARGB(255, 90, 249, 233) 
                        : Colors.white,
                  ),
                  child: Text(label),
                ),
              );
            }).toList(),
          ),
        ],
      );
    },
  );
}
}
