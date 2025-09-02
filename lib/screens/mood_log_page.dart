import 'package:flutter/material.dart';

class MoodLogPage extends StatefulWidget {
  const MoodLogPage({super.key});

  @override
  State<MoodLogPage> createState() => _MoodLogPageState();
}

class _MoodLogPageState extends State<MoodLogPage> {
  // Selected mood index
  int selectedMoodIndex = -1;

  // List of moods and emoji representation
  final List<Map<String, String>> moods = [
    {'emoji': '😄', 'label': 'Happy'},
    {'emoji': '🙂', 'label': 'Content'},
    {'emoji': '😐', 'label': 'Neutral'},
    {'emoji': '😔', 'label': 'Sad'},
    {'emoji': '😢', 'label': 'Depressed'},
  ];

  // Controller for optional notes
  final TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Log'),
        backgroundColor: const Color(0xFF56AB2F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'How are you feeling today?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Mood emoji selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(moods.length, (index) {
                final mood = moods[index];
                final isSelected = selectedMoodIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMoodIndex = index;
                    });
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: isSelected ? 30 : 25,
                        backgroundColor: isSelected
                            ? const Color(0xFF56AB2F)
                            : Colors.grey.shade200,
                        child: Text(
                          mood['emoji']!,
                          style: TextStyle(
                            fontSize: isSelected ? 28 : 24,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(mood['label']!),
                    ],
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),

            // Optional note
            const Text(
              'Add a note (optional):',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: noteController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Write something about your mood...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const Spacer(),

            // Submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedMoodIndex == -1
                    ? null
                    : () {
                        // Save mood and note to backend here
                        final selectedMood = moods[selectedMoodIndex]['label'];
                        final note = noteController.text;

                        // Example: print for now
                        print('Mood: $selectedMood, Note: $note');

                        // Navigate to next page
                        Navigator.pushNamed(context, '/journal');
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF56AB2F),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
