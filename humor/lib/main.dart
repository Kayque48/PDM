import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HumorApp()));
}

class HumorApp extends StatefulWidget {
  @override
  _humorAppState createState() => _humorAppState();
}

class _humorAppState extends State<HumorApp> {
  int estaHumor = 0;

  void estado() {
    setState(() {
      estaHumor = switch (estaHumor) {
        2 => 0,
        _ => estaHumor + 1,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = switch (estaHumor) {
      0 => Colors.grey.shade300,
      1 => Colors.yellow.shade600,
      _ => Colors.blue.shade300,
    };

    final textColor = switch (estaHumor) {
      0 => Colors.grey.shade800,
      1 => Colors.orange.shade900,
      _ => Colors.blue.shade900,
    };

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "Humor",
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              switch (estaHumor) {
                0 => Icons.sentiment_neutral_outlined,
                1 => Icons.mood,
                _ => Icons.mood_bad,
              },
              size: 92,
              color: textColor,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: estado,
              style: ElevatedButton.styleFrom(
                backgroundColor: textColor,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: Text(
                switch (estaHumor) {
                  0 => "Neutro",
                  1 => "Feliz",
                  _ => "Triste",
                },
                style: TextStyle(color: bgColor, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}